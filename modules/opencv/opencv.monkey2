Namespace opencv

#Import "externs.monkey2"

Public

#rem monkeydoc Copmuter Vision module for Monkey2 using OpenCV.
#end

Class OpenCV
	Field device:CVDevice
	Field version:="0.01"
	Field captureCount:Int
	Field rawBuffer:=New Byte[65536]
	
	Method Sleep(seconds:Double)
'		driver.Sleep(seconds)
	End
	
#rem monkeydoc scan device bus
#end

	Method New(index:Int)
		Print "OpenCVDevice.CaptureCount="+CVDevice.CaptureCount
		device=New CVDevice()
		Print "device[0].isOpen="+device.isOpen
	End	
	
#rem monkeydoc close all open device channels
#end
	Method CloseAll()
	end

#rem monkeydoc Name of input channel
#end
	Method InputName:String(index:Int)
		return ""
	End

#rem monkeydoc Name of output channel
#end
	Method OutputName:String(index:Int)
		return ""
	End
	
#rem monkeydoc Open specified device input channel
#end
	Method OpenInput(index:Int)
	End
		
#rem monkeydoc Open specified device output channel
#end
	Method OpenOutput(index:Int)
	End

#rem monkeydoc Send device data to specified device output channel
#end
	Method SendMessage(index:Int,data:Int)
	End

#rem monkeydoc Send raw device Sysex data (MSB ignored)
#end
	Method SendMessages(index:Int,data:int[])
	End

#rem monkeydoc Close specified device input channel
#end
	Method CloseInput(index:Int)
	end

#rem monkeydoc Close specified device output channel
#end
	Method CloseOutput(index:Int)
	end

#rem monkeydoc Returns number of device events in queue
#end
	Method HasEvent:Int()
		Return False
	End
	
#rem monkeydoc Return packed 4 bytes of current device event
#end
	Method EventDataLine:String()
		return ""
	End

#rem monkeydoc Return timestamp of event in seconds
#end
	Method EventTime:Double()
		return 0
	End

#rem monkeydoc Return contents of Sysex message
#end
	Method EventContent:Byte[]()		
		Return Null
	End
End
