#pragma once
#include <deque>
#include <mutex>
#include <iostream>
#include <string>
#include <queue>
#include <sstream>
#include <map>

struct MidiEvent{
	PmEvent event;
	std::string message;

	MidiEvent(PmEvent e,std::string m):event(e),message(m){
	}
};

class MidiStream{
public:
	bool direction; //true=output
	int index;
	PortMidiStream *stream;
	std::queue<MidiEvent> eventStack;
	std::stringbuf buffer;
	PmError error;
	const char *errorText;
	PmEvent sysEvent;
	std::string emptyString;
	int isOpen=0;
	int isSys=0;
	int isEvent=0;

	MidiStream(bool dir,int id,PortMidiStream *stream):direction(dir),index(id),stream(stream){
	}
	
	void Close(){
		if(stream){
			Pm_Close(stream);
			stream=nullptr;
		}
	}

//PMEXPORT PmError Pm_Write( PortMidiStream *stream, PmEvent *buffer, int32_t length );

	void writeData(PmEvent *buffer, int32_t length ){
		if(stream){
			PmError error=Pm_Write(stream,buffer,length);
		}
	}
/*
   When receiving sysex messages, the sysex message is terminated
   by either an EOX status byte (anywhere in the 4 byte messages) or
   by a non-real-time status byte in the low order byte of the message.
   If you get a non-real-time status byte but there was no EOX byte, it 
   means the sysex message was somehow truncated. This is not
   considered an error; e.g., a missing EOX can result from the user
   disconnecting a MIDI cable during sysex transmission.
*/
	void endSysex(){
		eventStack.push(MidiEvent(sysEvent,buffer.str()));
		buffer=std::stringbuf();
		isSys=false;
		printf("isSys false\n");
	}

	bool bufferSysexByte(int b){
		buffer.sputc(b);
		if((b&0xf8)==0xf8){
			endSysex();
			return true;
		}
		return false;
	}

	void bufferSysex(int b0,int b1,int b2){
		if (bufferSysexByte(b0)) return;
		if(b0==0xf7){
			endSysex();
			return;
		}
		if (bufferSysexByte(b1)) return;
		if (bufferSysexByte(b2)) return;
	}

	MidiEvent *currentEvent(){
		if (eventStack.empty()) return nullptr;
		return &eventStack.front();
	}

	bool HasInput(){

		if (!eventStack.empty()){
			eventStack.pop();
		}

		int result = Pm_Poll(stream);

		if(result<0){
			error=(PmError)result;
			errorText=Pm_GetErrorText(error);
			return false;
		}
						
		static PmEvent buffer[256];

		if(result>0){
			int n = Pm_Read(stream,buffer,256);		
			fflush(stdout);
			//printf("n=%d\n",n);
			for(int i=0;i<n;i++){
				PmMessage message=buffer[i].message;
				int status=Pm_MessageStatus(message);
				int b0=Pm_MessageData1(message);
				int b1=Pm_MessageData2(message);
				if(isSys){
					bufferSysex(status,b0,b1);
				}else{
					if(status==0xf0){
						printf("SYSEX %02x%02x\n",b0,b1);
						isSys=true;
						sysEvent=buffer[i];
						bufferSysex(0x00,b0,b1);
					}else{
						eventStack.push(MidiEvent(buffer[i],emptyString));
					}
				}
			}
		}	
						
		return !eventStack.empty();
	}
		
};

class MidiDriver{
	std::mutex mutex;
	std::map<int,MidiStream*> inputs;
	std::map<int,MidiStream*> outputs;

public:
	int deviceCount=0;
	const PmDeviceInfo *info;
	PmError error;
	const char *errorText;
	MidiEvent *currentEvent;
	
	MidiDriver(){
		Pm_Initialize();
		Pt_Start(100,0,0);
		deviceCount=Pm_CountDevices();
	}
	
	void Sleep(double duration){
		Pt_Sleep(duration);
	}
	
	void GetInfo(int id){
		info=Pm_GetDeviceInfo(id);
	}
		
	int OpenInput(int id){		

		PortMidiStream *stream;
		error=Pm_OpenInput(&stream, id, nullptr, 512, nullptr, nullptr);
		
		if (error){
			errorText=Pm_GetErrorText(error);			
			printf("error=%d %s\n",error,errorText);
			return -1;
		}
		
		inputs[id]=new MidiStream(false,id,stream);
		return id;
	}
	
	void CloseInput(int handle){
		auto input=inputs[handle];
		if(input) input->Close();
		delete input;
		inputs[handle]=nullptr;
	}
//Pm_OpenOutput (PortMidiStream **stream, PmDeviceID outputDevice, void *outputDriverInfo, long bufferSize, PmTimeProcPtr time_proc, void *time_info, long latency)
	int OpenOutput(int id){		

		PortMidiStream *stream;
		long latency=0;
		error=Pm_OpenOutput(&stream, id, nullptr, 512, nullptr, nullptr, latency);
		
		if (error){
			errorText=Pm_GetErrorText(error);			
			printf("error=%d %s\n",error,errorText);
			return -1;
		}
		
		outputs[id]=new MidiStream(true,id,stream);
		return id;
	}
	
	void OutputData(int handle,int data){
		PmEvent event={0};
		event.message=data;
		auto output=outputs[handle];
		if(output) output->writeData(&event,1);
	}
	
	void CloseOutput(int handle){
		auto output=outputs[handle];
		if(output) output->Close();
		delete output;
		outputs[handle]=nullptr;
	}

	bool HasInput(int handle){		
		auto input=inputs[handle];
		if(input){
			if (input->HasInput()){
				currentEvent=input->currentEvent();
				return true;
			}
		}
		return false;
	}

	int MidiEventData(){
		return currentEvent->event.message;
	}
	
	const char *MidiEventMessage(){
		return currentEvent->message.c_str();
	}
	
	int MidiEventMessageLength(){
		return currentEvent->message.length();
	}
	
	double MidiEventTimestamp(){
		return currentEvent->event.timestamp;
	}

	void *Handle(){
		return (void *)this;
	}
};


/*
PMEXPORT PmError Pm_OpenInput( PortMidiStream** stream,
                PmDeviceID inputDevice,
                void *inputDriverInfo,
                int32_t bufferSize,
                PmTimeProcPtr time_proc,
                void *time_info );

PMEXPORT PmError Pm_OpenOutput( PortMidiStream** stream,
                PmDeviceID outputDevice,
                void *outputDriverInfo,
                int32_t bufferSize,
                PmTimeProcPtr time_proc,
                void *time_info,
                double latency );
*/	
