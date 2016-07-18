#import "<portaudio>"

Using portaudio..

Function Main()
	Print "startAudio:"+StartAudio()

	Local n:=AudioDeviceCount()

	Print "audioDevices:"+n

	For Local i:=0 Until n
		Local h:=OpenAudioDevice(i)
		Local s:=String.FromCString(DeviceName(h))
		Print s+" ins="+DeviceInputs(h)+" outs="+DeviceOutputs(h)	
	Next
		
End
	