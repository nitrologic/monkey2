#pragma once

#include <deque>
#include <mutex>
#include <iostream>
#include <string>
#include <queue>
#include <sstream>
#include <map>
#include <stack>

#define HAS_PORTAUDIO

class AudioDevice{
public:	
	AudioDevice(int id):device_id(id),numInput(0),numOutput(0){}
	virtual ~AudioDevice(){}
	
	virtual bool OpenAudioIn(){return false;}
	virtual bool OpenAudioOut(){return false;}
	virtual void CloseAudioIn(){}
	virtual void CloseAudioOut(){}
	
	virtual int PollInput(){return 0;}

	virtual bool WriteMidiOut(int b0,int b1,int b2){return false;}	
	virtual bool WriteSysEx(const char *message){return false;}

	char name[256];
	int device_id;
	int numInput;
	int numOutput;
};

std::vector<class AudioDevice*> devices;

#ifdef HAS_PORTAUDIO

#include "portaudio.h"

class PortAudioDevice: public AudioDevice{

	static PaError error;

public:	

	static int Mount(){		
		error=Pa_Initialize();	
		if(error){
			return error;
		}

		int n=Pa_GetDeviceCount();

		for(int i=0;i<n;i++){
			PortAudioDevice *device=new PortAudioDevice(i);
			devices.push_back(device);
		}

		return 0;
	}

	PortAudioDevice(int id):AudioDevice(id){
		const PaDeviceInfo *info = Pa_GetDeviceInfo(device_id);
		numInput=info->maxInputChannels;
		numOutput=info->maxOutputChannels;
		int n=snprintf(name,256,"%s",info->name);
//		printf("PortAudioDevice %d %s\n",id,name);
	}
	
	bool OpenAudioIn(int channel){
		if (channel>=numInput) return false;
		return true;
	}
	
	bool OpenAudioOut(int channel){
		if (channel>=numOutput) return false;
		return false;
	}
	
	void CloseAudioIn(int channel){
	}
	
	void CloseAudioOut(int channel){
	}
	
	int PollInput(){
		return 0;
	}
	
	bool WriteMidiOut(int b0,int b1,int b2){
		return false;
	}	

	bool WriteSysEx(const char *message){
		return false;
	}	
};

PaError PortAudioDevice::error;

#endif

int StartAudio(){    
#ifdef HAS_PORTAUDIO	
	int error=PortAudioDevice::Mount();
//	host->mount();
    return error;
#else
	return -1;
#endif	
}

void StopAudio(){
}

int AudioDeviceCount(){
	return devices.size();
}

int OpenAudioDevice(int index){
	if(index<devices.size()){
		AudioDevice *device=devices[index];
//		printf("OpenAudioDevice[%d]\n",index);
		return (int)index;	// TODO: add device offset encoding
	}
	printf("index size fail %d %d\n",index,devices.size());
	return -1;
}

char *DeviceName(int handle){
	AudioDevice* device=devices[handle];
	if (device) return device->name;
	return "bob";
}

int DeviceInputs(int deviceHandle){
	AudioDevice* device=devices[deviceHandle];
	return device->numInput;
}

int DeviceOutputs(int deviceHandle){
	AudioDevice* device=devices[deviceHandle];
	return device->numOutput;	
}

// TODO: Device means Audio


int AudioEventData(){
	return 0;
}

double AudioEventTimestamp(){
	return 0.0f;
}

int AudioInOpen(int handle){
	AudioDevice* device=devices[handle];
	return device->OpenAudioIn();
}

int AudioInPoll(int handle){
	AudioDevice* device=devices[handle];
	return device->PollInput();
}

void AudioInClose(int handle){
	AudioDevice* device=devices[handle];
	device->CloseAudioIn();
}

int AudioOutOpen(int handle){
	AudioDevice* device=devices[handle];
	return device->OpenAudioOut();
}

int AudioOutSend(int handle,int b0,int b1, int b2){  
	AudioDevice* device=devices[handle];	
	return 0;
}

void AudioOutClose(int handle){
	AudioDevice* device=devices[handle];
	device->CloseAudioOut();
}
