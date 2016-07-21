#Import "<std>"
#Import "<portmidi>"

Using std..
Using portmidi..

Function Main()
	Print "PortMidi test 0.1"
	Print "Scanning Midi Bus, please wait."
	Local portMidi:=New PortMidi()

	Local inputs:=portMidi.inputDevices.Length
	Print "inputs="+inputs
	if inputs=0 return
	For Local i:=0 Until inputs
		portMidi.OpenInput(i)
		Print "Open Input #"+i
	Next
	
	Local outputs:=portMidi.outputDevices.Length
	Print "outputs="+inputs
	For Local i:=0 Until outputs
		portMidi.OpenOutput(i)
		Print "Open Output #"+i
	next

	While True
		While portMidi.HasEvent()
			Local b:=portMidi.EventDataBytes()
			Print "MidiEvent:"+b[0]+" "+b[1]+" "+b[2]+" "+b[3]			
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
		portMidi.OutputData(i,noteon)
	Next
	portMidi.Sleep(0.5)
	Print "note off"
	For Local i:=0 Until outputs
		portMidi.OutputData(i,noteoff)
	next

End
