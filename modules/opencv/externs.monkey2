Namespace opencv

#Import "<std>"

#Import "include/*.h"
#Import "*.h"

#import "cvdevice.cpp"

#If __HOSTOS__="windows"

#Endif

#If __HOSTOS__="macos"

#Import "libs/libopencv_ts.a"

#Import "libs/libopencv_core.3.1.0.dylib"
#Import "libs/libopencv_imgcodecs.3.1.0.dylib" 
#Import "libs/libopencv_imgproc.3.1.0.dylib" 
#Import "libs/libopencv_highgui.3.1.0.dylib"
#Import "libs/libopencv_video.3.1.0.dylib"
#Import "libs/libopencv_videoio.3.1.0.dylib"

#Endif

#If __HOSTOS__="linux"

#Endif

#If __HOSTOS__="pi"

#Import "<libasound.a>"
#Import "<libpthread.a>"

'#import "pm_linux/finddefault.c"
'#import "pm_linux/pmlinux.c"
'#import "pm_linux/pmlinuxalsa.c"
'#import "porttime/ptlinux.c"

#Endif

#Import "cvdevice.h"

Extern

Class CVDevice Extends Void 
	global CaptureCount:Int
	global Version:Int	
	Field isOpen:Bool
End
