
#import "<libc>"

#if __HOSTOS__="windows"

	#import "openal-soft/bin/OpenAL32.dll"
	#import "openal-soft/lib/OpenAL32.lib"
	
	#import "openal-soft/include/*.h"
	#import "<AL/al.h>"
	#import "<AL/alc.h>"

#else if __HOSTOS__="macos"

	#import "<OpenAL.framework>"
	
	#import "<OpenAL/al.h>"
	#import "<OpenAL/alc.h>"
	
#else if __HOSTOS__="linux"

	#import "<libopenal.a>"
	#import "<AL/al.h>"
	#import "<AL/alc.h>"

#else if __HOSTOS__="pi"

	#import "<libopenal.a>"
	#import "<AL/al.h>"
	#import "<AL/alc.h>"
	
#endif
		
Namespace openal

'***** ALC *****

Alias ALCchar:libc.char_t
Alias ALCboolean:Bool
Alias ALCenum:Int
Alias ALCint:Int
Alias ALCuint:UInt
Alias ALCsizei:UInt

Extern

Const ALC_FALSE:ALCenum
Const ALC_TRUE:ALCenum
Const ALC_FREQUENCY:ALCenum
Const ALC_REFRESH:ALCenum
Const ALC_SYNC:ALCenum
Const ALC_MONO_SOURCES:ALCenum
Const ALC_STEREO_SOURCES:ALCenum
Const ALC_NO_ERROR:ALCenum
Const ALC_INVALID_DEVICE:ALCenum
Const ALC_INVALID_CONTEXT:ALCenum
Const ALC_INVALID_ENUM:ALCenum
Const ALC_INVALID_VALUE:ALCenum
Const ALC_OUT_OF_MEMORY:ALCenum
Const ALC_DEFAULT_DEVICE_SPECIFIER:ALCenum
Const ALC_DEVICE_SPECIFIER:ALCenum
Const ALC_EXTENSIONS:ALCenum
Const ALC_MAJOR_VERSION:ALCenum
Const ALC_MINOR_VERSION:ALCenum
Const ALC_ATTRIBUTES_SIZE:ALCenum
Const ALC_ALL_ATTRIBUTES:ALCenum
Const ALC_CAPTURE_DEVICE_SPECIFIER:ALCenum
Const ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER:ALCenum
Const ALC_CAPTURE_SAMPLES:ALCenum

Struct ALCdevice
End

Struct ALCcontext
End

Function alcCreateContext:ALCcontext Ptr( device:ALCdevice Ptr,attrlist:ALCint Ptr )
Function alcMakeContextCurrent:ALCboolean( context:ALCcontext ptr )
Function alcProcessContext( context:ALCcontext Ptr )
Function alcSuspendContext( context:ALCcontext Ptr )
Function alcDestroyContext( context:ALCcontext Ptr )
Function alcGetCurrentContext:ALCcontext Ptr()
Function alcGetContextsDevice:ALCdevice Ptr( context:ALCcontext Ptr )
Function alcOpenDevice:ALCdevice Ptr( deviceName:ALCchar Ptr  )
Function alcCloseDevice:ALCboolean( device:ALCdevice Ptr )
Function alcGetError:ALCenum( device:ALCdevice Ptr )
Function alcIsExtensionPresent:ALCboolean( device:ALCdevice ptr,extName:ALCchar Ptr )
Function alcGetProcAddress:Void Ptr( device:ALCdevice Ptr,funcName:ALCchar Ptr )
Function alcGetEnumValue:ALCenum( device:ALCdevice Ptr,enumName:ALCchar Ptr )
Function alcGetString:ALCchar Ptr( device:ALCdevice Ptr,param:ALCenum )
Function alcGetIntegerv( device:ALCdevice Ptr,param:ALCenum,size:ALCsizei,values:ALCint Ptr )
Function alcCaptureOpenDevice:ALCdevice Ptr( deviceName:ALCchar Ptr,frequency:ALCuint,format:ALCenum,buffersize:ALCsizei )
Function alcCaptureCloseDevice:ALCboolean( device:ALCdevice Ptr )
Function alcCaptureStart( device:ALCdevice Ptr )
Function alcCaptureStop( device:ALCdevice Ptr )
Function alcCaptureSamples( device:ALCdevice Ptr,buffer:Void Ptr,samples:ALCsizei )

'***** AL *****

Alias ALchar:libc.char_t
Alias ALboolean:Bool
Alias ALenum:Int
Alias ALint:Int
Alias ALuint:UInt
Alias ALsizei:UInt
Alias ALfloat:Float
Alias ALdouble:Double

Const AL_NONE:ALenum
Const AL_FALSE:ALenum
Const AL_TRUE:ALenum
Const AL_SOURCE_RELATIVE:ALenum
Const AL_CONE_INNER_ANGLE:ALenum
Const AL_CONE_OUTER_ANGLE:ALenum
Const AL_PITCH:ALenum
Const AL_POSITION:ALenum
Const AL_DIRECTION:ALenum
Const AL_VELOCITY:ALenum
Const AL_LOOPING:ALenum
Const AL_BUFFER:ALenum
Const AL_GAIN:ALenum
Const AL_MIN_GAIN:ALenum
Const AL_MAX_GAIN:ALenum
Const AL_ORIENTATION:ALenum
Const AL_SOURCE_STATE:ALenum
Const AL_INITIAL:ALenum
Const AL_PLAYING:ALenum
Const AL_PAUSED:ALenum
Const AL_STOPPED:ALenum
Const AL_BUFFERS_QUEUED:ALenum
Const AL_BUFFERS_PROCESSED:ALenum
Const AL_REFERENCE_DISTANCE:ALenum
Const AL_ROLLOFF_FACTOR:ALenum
Const AL_CONE_OUTER_GAIN:ALenum
Const AL_MAX_DISTANCE:ALenum
Const AL_SEC_OFFSET:ALenum
Const AL_SAMPLE_OFFSET:ALenum
Const AL_BYTE_OFFSET:ALenum
Const AL_SOURCE_TYPE:ALenum
Const AL_STATIC:ALenum
Const AL_STREAMING:ALenum
Const AL_UNDETERMINED:ALenum
Const AL_FORMAT_MONO8:ALenum
Const AL_FORMAT_MONO16:ALenum
Const AL_FORMAT_STEREO8:ALenum
Const AL_FORMAT_STEREO16:ALenum
Const AL_FREQUENCY:ALenum
Const AL_BITS:ALenum
Const AL_CHANNELS:ALenum
Const AL_SIZE:ALenum
Const AL_UNUSED:ALenum
Const AL_PENDING:ALenum
Const AL_PROCESSED:ALenum
Const AL_NO_ERROR:ALenum
Const AL_INVALID_NAME:ALenum
Const AL_INVALID_ENUM:ALenum
Const AL_INVALID_VALUE:ALenum
Const AL_INVALID_OPERATION:ALenum
Const AL_OUT_OF_MEMORY:ALenum
Const AL_VENDOR:ALenum
Const AL_VERSION:ALenum
Const AL_RENDERER:ALenum
Const AL_EXTENSIONS:ALenum
Const AL_DOPPLER_FACTOR:ALenum
Const AL_DOPPLER_VELOCITY:ALenum
Const AL_SPEED_OF_SOUND:ALenum
Const AL_DISTANCE_MODEL:ALenum
Const AL_INVERSE_DISTANCE:ALenum
Const AL_INVERSE_DISTANCE_CLAMPED:ALenum
Const AL_LINEAR_DISTANCE:ALenum
Const AL_LINEAR_DISTANCE_CLAMPED:ALenum
Const AL_EXPONENT_DISTANCE:ALenum
Const AL_EXPONENT_DISTANCE_CLAMPED:ALenum

Function alDopplerFactor( value:ALfloat )
Function alDopplerVelocity(value:ALfloat)
Function alSpeedOfSound( value:ALfloat )
Function alDistanceModel( distanceModel:ALenum )
Function alEnable( capability:ALenum )
Function alDisable( capability:ALenum )
Function alIsEnabled:ALboolean( capability:ALenum )
Function alGetString:ALchar Ptr( param:ALenum )
Function alGetBooleanv( param:ALenum,values:ALboolean Ptr )
Function alGetIntegerv( param:ALenum,values:ALint Ptr )
Function alGetFloatv( param:ALenum,values:ALfloat Ptr )
Function alGetDoublev( param:ALenum,values:ALdouble Ptr )
Function alGetBoolean:ALboolean( param:ALenum )
Function alGetInteger:ALint( param:ALenum )
Function alGetFloat:ALfloat( param:ALenum )
Function alGetDouble:ALdouble( param:ALenum )
Function alGetError:ALenum()
Function alIsExtensionPresent:ALboolean( extName:ALchar Ptr )
Function alGetProcAddress:Void Ptr( fname:ALchar Ptr )
Function alGetEnumValue:ALenum( name:ALchar Ptr )
Function alListenerf( param:ALenum,value:ALfloat )
Function alListener3f( param:ALenum,value1:ALfloat,value2:ALfloat,value3:ALfloat )
Function alListenerfv( param:ALenum,values:ALfloat Ptr )
Function alListeneri( param:ALenum,value:ALint )
Function alListener3i( param:ALenum,value1:ALint,value2:ALint,value3:ALint )
Function alListeneriv( param:ALenum,values:ALint Ptr )
Function alGetListenerf( param:ALenum,value:ALfloat Ptr )
Function alGetListener3f( param:ALenum,value1:ALfloat Ptr,value2:ALfloat Ptr,value3:ALfloat Ptr )
Function alGetListenerfv( param:ALenum,values:ALfloat Ptr )
Function alGetListeneri( param:ALenum,value:ALint Ptr )
Function alGetListener3i( param:ALenum,value1:ALint Ptr,value2:ALint Ptr,value3:ALint Ptr )
Function alGetListeneriv( param:ALenum,values:ALint Ptr )
Function alGenSources( n:ALsizei,sources:ALuint Ptr )
Function alDeleteSources( n:ALsizei,sources:ALuint Ptr )
Function alIsSource:ALboolean( source:ALuint )
Function alSourcef( source:ALuint,param:ALenum,value:ALfloat )
Function alSource3f( source:ALuint,param:ALenum,value1:ALfloat,value2:ALfloat,value3:ALfloat )
Function alSourcefv( source:ALuint,param:ALenum,values:ALfloat Ptr )
Function alSourcei( source:ALuint,param:ALenum,value:ALint )
Function alSource3i( source:ALuint,param:ALenum,value1:ALint,value2:ALint,value3:ALint )
Function alSourceiv( source:ALuint,param:ALenum,values:ALint Ptr )
Function alGetSourcef( source:ALuint,param:ALenum,value:ALfloat Ptr )
Function alGetSource3f( source:ALuint,param:ALenum,value1:ALfloat Ptr,value2:ALfloat Ptr,value3:ALfloat Ptr )
Function alGetSourcefv( source:ALuint,param:ALenum,values:ALfloat Ptr )
Function alGetSourcei( source:ALuint,param:ALenum,value:ALint Ptr )
Function alGetSource3i( source:ALuint,param:ALenum,value1:ALint Ptr,value2:ALint Ptr,value3:ALint Ptr )
Function alGetSourceiv( source:ALuint,param:ALenum,values:ALint Ptr )
Function alSourcePlayv( n:ALsizei,sources:ALuint Ptr )
Function alSourceStopv( n:ALsizei,sources:ALuint Ptr )
Function alSourceRewindv( n:ALsizei,sources:ALuint Ptr )
Function alSourcePausev( n:ALsizei,sources:ALuint Ptr )
Function alSourcePlay( source:ALuint )
Function alSourceStop( source:ALuint )
Function alSourceRewind( source:ALuint )
Function alSourcePause( source:ALuint )
Function alSourceQueueBuffers( source:ALuint,nb:ALsizei,buffers:ALuint Ptr )
Function alSourceUnqueueBuffers( source:ALuint,nb:ALsizei,buffers:ALuint Ptr )
Function alGenBuffers( n:ALsizei,buffers:ALuint Ptr )
Function alDeleteBuffers( n:ALsizei,buffers:ALuint Ptr )
Function alIsBuffer:ALboolean( buffer:ALuint )
Function alBufferData( buffer:ALuint,format:ALenum,data:Void Ptr,size:ALsizei,freq:ALsizei )
Function alBufferf( buffer:ALuint,param:ALenum,value:ALfloat )
Function alBuffer3f( buffer:ALuint,param:ALenum,value1:ALfloat,value2:ALfloat,value3:ALfloat )
Function alBufferfv( buffer:ALuint,param:ALenum,values:ALfloat Ptr )
Function alBufferi( buffer:ALuint,param:ALenum,value:ALint )
Function alBuffer3i( buffer:ALuint,param:ALenum,value1:ALint,value2:ALint,value3:ALint )
Function alBufferiv( buffer:ALuint,param:ALenum,values:ALint Ptr )
Function alGetBufferf( buffer:ALuint,param:ALenum,value:ALfloat Ptr )
Function alGetBuffer3f( buffer:ALuint,param:ALenum,value1:ALfloat Ptr,value2:ALfloat Ptr,value3:ALfloat Ptr )
Function alGetBufferfv( buffer:ALuint,param:ALenum,values:ALfloat Ptr )
Function alGetBufferi( buffer:ALuint,param:ALenum,value:ALint Ptr )
Function alGetBuffer3i( buffer:ALuint,param:ALenum,value1:ALint Ptr,value2:ALint Ptr,value3:ALint Ptr )
Function alGetBufferiv( buffer:ALuint,param:ALenum,values:ALint Ptr )
