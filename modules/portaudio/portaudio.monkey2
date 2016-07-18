Namespace portaudio

#Import "<libc.monkey2>"

Using libc

#Import "include/*.h"
#Import "src/common/*.h"

#Import "src/common/pa_allocation.c"
#Import "src/common/pa_converters.c"
#Import "src/common/pa_cpuload.c"
#Import "src/common/pa_debugprint.c"
#Import "src/common/pa_dither.c"
#Import "src/common/pa_front.c"
#Import "src/common/pa_process.c"
#Import "src/common/pa_ringbuffer.c"
#Import "src/common/pa_stream.c"
#Import "src/common/pa_trace.c"

#If __HOSTOS__="windows"

#Import "src/os/win/*.h"

#Endif

#If __HOSTOS__="macos"
#Import "<CoreAudio.framework>"
#Import "<AudioToolbox.framework>"
#Import "<AudioUnit.framework>"
#Import "<IOKit.framework>"
#Import "<CoreFoundation.framework>"
#Import "<Carbon.framework>"
#Import "src/hostapi/coreaudio/pa_mac_core.c"
#Import "src/hostapi/coreaudio/pa_mac_core_blocking.c"
#Import "src/hostapi/coreaudio/pa_mac_core_utilities.c"
#Import "src/os/unix/pa_unix_util.c"
#Import "src/os/unix/pa_unix_hostapis.c"
#Endif

#If __HOSTOS__="linux"

#Import "<libpthread.a>"
#Import "src/os/unix/*.h"

#Import "src/os/unix/pa_unix_util.c"
#Import "src/os/unix/pa_unix_hostapis.c"

#Endif

#If __HOSTOS__="pi"

#Import "<libasound.a>"
#Import "<libpthread.a>"

#Import "src/os/unix/pa_unix_util.c"
#Import "src/os/unix/pa_unix_hostapis.c"

#Endif

#Import "<portaudio.h>"
#Import "audiodriver.h"

Extern

Alias cstring:libc.char_t ptr
Alias Handle:Int

Function StartAudio:Int()
Function StopAudio:Int()
Function AudioDeviceCount:Int()
Function OpenAudioDevice:Handle(index:Int)

Function DeviceName:cstring(index:Handle)
Function DeviceInputs:Int(index:Handle)
Function DeviceOutputs:Int(index:Handle)

Function AudioInOpen(handle:Handle)
Function AudioInPoll(handle:Handle)
Function AudioInClose(handle:Handle)
Function AudioOutOpen(handle:Handle)
Function AudioOutSend(handle:Handle)
Function AudioOutClose(handle:Handle)

Function AudioEventData:Int()
Function AudioEventTimestamp:Double()
