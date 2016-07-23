#Import "<std>"
#Import "<portmidi>"

Using std..
Using portmidi..

Const SysEx1:=New UByte[]($f0,$43,$20,$9,$f7,0)
Const SysEx2:=New UByte[]($f0,$43,$20,$0,$f7,0)

Function BytesToMessages:Int[](bytes:UByte[])
	Local n:=bytes.Length
	Local n3:=n/3	'TODO currently MUST be a multiple of 3
	Local ints:=New Int[n3]
	For Local i:=0 Until n3
		ints[i]=bytes[i*3+0]|(bytes[i*3+1] Shl 8)|(bytes[i*3+2] Shl 16)
	Next
	Return ints
End

Function Main()
	Print "PortMidi test 0.1"
	Print "Scanning Midi Bus, please wait."
	Local portMidi:=New PortMidi()

	Local inputs:=portMidi.inputDevices.Length
	if inputs=0 return
	For Local i:=0 Until inputs
		portMidi.OpenInput(i)
	Next
	
	Local outputs:=portMidi.outputDevices.Length
	For Local i:=0 Until outputs
		portMidi.OpenOutput(i)

'		Local MidiReset0:Int=$41f0
'		Local MidiReset1:Int=$1100
'		Local MidiReset:Int=$404090
'		Print "sending midi Reset"		

'		portMidi.OutputData(i,MidiReset0)
'		portMidi.OutputData(i,MidiReset1)

'		Print "sending midi bytes"		
'		Local sysex:=BytesToMessages(SysEx2)
'		portMidi.SendMessages(i,sysex)
	Next

	While True
		While portMidi.HasEvent()
			Local b:=portMidi.EventDataBytes()
			Local s:=portMidi.EventContent()
'			Print "MidiEvent:"+b[0]+" "+b[1]+" "+b[2]+" "+b[3]+" +"+s.Length
			Print "MidiEvent:"+Hex2(b[0])+" "+Hex2(b[1])+" "+Hex2(b[2])+" +"+s.Length			
			Local bin:String
			For Local i:=0 Until s.Length
				bin+=Hex2(s[i])
			Next
			Print bin						
		Wend
		portMidi.Sleep(1.0/60)
	Wend
End


function testOutput(portMidi:PortMidi)
	Local outputs:=portMidi.outputDevices.Length

	Local counter:Int
	Const NoteOn:=144
	Const NoteOff:=128
	
	Local noteon:Int=(NoteOn)|(65 Shl 8)|(100 Shl 16)
	Local noteoff:Int=(NoteOff)|(65 Shl 8)|(0 Shl 16)
'	Local noteoff:Int=(NoteOn)|(65 Shl 8)|(0 Shl 16)

	For Local i:=0 Until outputs
		portMidi.SendMessage(i,noteon)
	Next

	portMidi.Sleep(0.5)
	
	Print "note off"
	For Local i:=0 Until outputs
		portMidi.SendMessage(i,noteoff)
	Next

End
