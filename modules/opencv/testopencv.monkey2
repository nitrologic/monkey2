#Import "<std>"
#Import "<opencv>"

Using std..
Using opencv..

Function Main()
	Print "OpenCV test 0.1"
	Print "Scanning Device Bus, please wait."

	Local cap:=New OpenCV(0)
	Print "cap.isOpen="+cap.device.isOpen	
End
