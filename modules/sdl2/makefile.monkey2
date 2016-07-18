
Namespace sdl2

#If __TARGET__="desktop"
	#If __HOSTOS__="macos"
		#Import "makefile_macos.monkey2"
	#Elseif __HOSTOS__="windows"
		#Import "makefile_windows.monkey2"
	#Elseif __HOSTOS__="linux"
		#Import "makefile_linux.monkey2"
	#Elseif __HOSTOS__="pi"
		#Import "makefile_pi.monkey2"
	#Endif
#Elseif __TARGET__="emscripten"
	#Import "makefile_emscripten.monkey2"
#Endif
