Namespace portmidi

#Import "<std>"

#Import "pm_common/*.h"
#Import "porttime/*.h"

#Import "pm_common/portmidi.h"
#Import "pm_common/portmidi.c"
#Import "pm_common/pmutil.c"

#Import "porttime/porttime.h"
#Import "porttime/porttime.c"

#If __HOSTOS__="windows"

#Import "pm_win/pmwin.c"
#Import "pm_win/pmwinmm.c"
#Import "porttime/ptwinmm.c"

#Endif

#If __HOSTOS__="macos"

#Import "<CoreMIDI.framework>"
#Import "<CoreAudio.framework>"
#Import "<CoreFoundation.framework>"
#Import "<Carbon.framework>"

#Import "pm_mac/finddefault.c"
#Import "pm_mac/pmmac.c"
#Import "pm_mac/pmmacosxcm.c"
#Import "pm_mac/readbinaryplist.c"
#Import "porttime/ptmac.c"

#Endif

#If __HOSTOS__="linux"

#Import "<libpthread.a>"
#import "pm_linux/finddefault.c"
#import "pm_linux/pmlinux.c"
#import "pm_linux/pmlinuxalsa.c"
#import "porttime/ptlinux.c"

#Endif

#If __HOSTOS__="pi"

#Import "<libasound.a>"
#Import "<libpthread.a>"
#import "pm_linux/finddefault.c"
#import "pm_linux/pmlinux.c"
#import "pm_linux/pmlinuxalsa.c"
#import "porttime/ptlinux.c"

#Endif

#Import "mididriver.h"

Extern

Class PmDeviceInfo Extends Void
	Field structVersion:Int
	Field interf:Byte Ptr		' underlying MIDI API, e.g. MMSystem or DirectX
	Field name:Byte Ptr		' device name, e.g. USB MidiSport 1x1 
	Field input:Int
	Field output:Int	
	Field opened:Int
End

Alias Handle:Int

Class MidiDriver Extends Void 
	Field deviceCount:Int
	Field error:Int
	Field errorText:Byte Ptr
	Field info:PmDeviceInfo

	Method Sleep(duration:Double)
	Method GetInfo(index:Int)	

	Method OpenOutput:Handle(index:Int)
	Method OutputData(index:Int,data:Int)
	Method CloseOutput(handle:Handle)

	Method OpenInput:Handle(index:Int)
	Method HasInput:Bool(handle:Handle)
	Method MidiEventData:Int()
	Method MidiEventMessage:Byte Ptr()
	Method MidiEventMessageLength:Int()
	Method MidiEventTimestamp:Double()	
	Method CloseInput(handle:Handle)
End

Public

Alias HandleStack:std.collections.Stack<Int>
Alias HandleMap:std.collections.Map<Int,Int>

#rem monkeydoc Desktop MIDI courtesy PortMidi library.
#end

Class PortMidi
	Field version:="0.02"
	Field deviceCount:Int
	
	Field driver:MidiDriver
	
#rem monkeydoc A stack of available MIDI inputs.
#end
	Field inputDevices:=New HandleStack()
#rem monkeydoc A stack of available MIDI outputs.
#end
	Field outputDevices:=New HandleStack()
#rem monkeydoc A map of open MIDI inputs
#end
	Field openInputs:=New HandleMap()
#rem monkeydoc A map of open MIDI outputs
#end
	Field openOutputs:=New HandleMap()
	
#rem monkeydoc High resolution PortMidi sleep command.
#end
	Method Sleep(seconds:Double)
		driver.Sleep(seconds)
	End

#rem monkeydoc scan midi bus
#end
	Method New() 
		Print "PortMidi courtesy github/nitrologic/monkey2/modules"
		driver=New MidiDriver()
		Print "countDevices="+driver.deviceCount
		For Local id:=0 Until driver.deviceCount
			driver.GetInfo(id)
			if driver.info.input inputDevices.Push(id)
			If driver.info.output outputDevices.Push(id)
		Next
	End	
	
#rem monkeydoc close all open MIDI channels
#end
	Method CloseAll()
		Local indexes:=New HandleStack()
		For Local in:=Eachin openInputs.Keys
			indexes.Push(in)
		Next
		For Local index:=Eachin indexes
			CloseInput(index)
		Next
		indexes.Clear()
		For Local out:=Eachin openOutputs.Keys
			indexes.Push(out)
		Next
		For Local index:=Eachin indexes
			CloseOutput(index)
		Next
	end

#rem monkeydoc Name of input channel
#end
	Method InputName:String(index:Int)
		Local id:=inputDevices.Get(index)		
		driver.GetInfo(id)
		Local interf:=String.FromCString(driver.info.interf)
		Local  name:=String.FromCString(driver.info.name)
		Return name
	End

#rem monkeydoc Name of output channel
#end
	Method OutputName:String(index:Int)
		Local id:=inputDevices.Get(index)		
		driver.GetInfo(id)
		Local interf:=String.FromCString(driver.info.interf)
		Local  name:=String.FromCString(driver.info.name)
		Return name
	End
	
#rem monkeydoc Open specified MIDI input channel
#end
	Method OpenInput(index:Int)
		Local id:=inputDevices.Get(index)		
		Local input:=driver.OpenInput(id)
		Print "PortMidi Open input"+index+"@"+id+"="+input
		openInputs[index]=id
	End
		
#rem monkeydoc Open specified MIDI output channel
#end
	Method OpenOutput(index:Int)
		Local id:=outputDevices.Get(index)		
		Local output:=driver.OpenOutput(id)
		Print "PortMidi Open output"+index+"@"+id+"="+output
		openOutputs[index]=id
	End

#rem monkeydoc Send MIDI data to specified MIDI output channel
#end
	Method OutputData(index:Int,data:Int)
		Local id:=outputDevices.Get(index)		
		driver.OutputData(id,data)
	End

#rem monkeydoc Close specified MIDI input channel
#end
	Method CloseInput(index:Int)
		Local id:=openInputs[index]
		driver.CloseInput(id)
		Print "PortMidi Close input"+index+"@"+id
		openInputs.Remove(index)
	end

#rem monkeydoc Close specified MIDI output channel
#end
	Method CloseOutput(index:Int)
		Local id:=openOutputs[index]
		driver.CloseOutput(id)
		Print "PortMidi Close output"+index+"@"+id
		openOutputs.Remove(index)
	end

#rem monkeydoc Returns number of MIDI events in queue
#end
	Method HasEvent:Int()
		For Local index:=Eachin openInputs.Keys
			Local id:=openInputs[index]
			if driver.HasInput(id) Return true
		Next
		Return False
	End
	
#rem monkeydoc Return packed 4 bytes of current MIDI event
#end
	Method EventData:Int()
		Return driver.MidiEventData()
	End

#rem monkeydoc Return separate 4 bytes of current MIDI event
#end
	Method EventDataBytes:UByte[]()
		Local i:=EventData()
		Return new UByte[](i&$ff,(i Shr 8)&$ff,(i Shr 16)&$ff,(i Shr 24)&$ff)
	End

#rem monkeydoc Return timestamp of event in seconds
#end
	Method EventTime:Double()
		Return driver.MidiEventTimestamp()
	End
End

