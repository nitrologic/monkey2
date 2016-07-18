
Namespace gles20

#Import "<libc.monkey2>"

Using monkey

#If __TARGET__="desktop"

	#If __HOSTOS__="windows"
	
		'USE ANGLE!
		#Import "angle/include/*.h"
		#Import "<GLES2/gl2.h>"

		#Import "angle/lib/libEGL.lib"
		#Import "angle/lib/libGLESv2.lib"
		
		#Import "angle/bin/libEGL.dll"
		#Import "angle/bin/libGLESv2.dll"
		#Import "angle/bin/d3dcompiler_47.dll"
		
	#Else If __HOSTOS__="macos"
	
		#Import "native/gles20_macos.h"
		#Import "<OpenGL.framework>"

	#Else If __HOSTOS__="pi"

		#Import "<EGL/egl.h>"
		#Import "<GLES2/gl2.h>"
		#Import "<libEGL.a>"
		#Import "<libGLESv2.a>"
		#Import "<libbcm_host.a>"		
		
	#Else If __HOSTOS__="linux"
	
		#Import "native/gles20_linux.h"
		#Import "<libGL.a>"
		
	#Endif
	
#Else If __TARGET__="emscripten"

	#Import "<GLES2/gl2.h>"	
	
#Endif

#rem
typedef void             GLvoid;
typedef char             GLchar;
typedef unsigned int     GLenum;
typedef unsigned char    GLboolean;
typedef unsigned int     GLbitfield;
typedef khronos_int8_t   GLbyte;
typedef short            GLshort;
typedef int              GLint;
typedef int              GLsizei;
typedef khronos_uint8_t  GLubyte;
typedef unsigned short   GLushort;
typedef unsigned int     GLuint;
typedef khronos_float_t  GLfloat;
typedef khronos_float_t  GLclampf;
typedef khronos_int32_t  GLfixed;

typedef khronos_intptr_t GLintptr;
typedef khronos_ssize_t  GLsizeiptr;
#end

'Not quite right, but less annoying...
Alias GLvoid:Void
Alias GLenum:Int
Alias GLboolean:Bool
Alias GLbitfield:Int
Alias GLshort:Short
Alias GLint:Int
Alias GLsizei:Int
Alias GLubyte:UByte
Alias GLushort:UShort
Alias GLuint:UInt
Alias GLfloat:Float
Alias GLfixed:Int
Alias GLclampf:Float
Alias GLintptr:Int
Alias GLsizeiptr:Int

Extern

Struct GLchar="char"
End

Struct GLcchar="const char"
End

'${CONSTS}
Const GL_ES_VERSION_2_0:Int
Const GL_DEPTH_BUFFER_BIT:Int
Const GL_STENCIL_BUFFER_BIT:Int
Const GL_COLOR_BUFFER_BIT:Int
Const GL_FALSE:Int
Const GL_TRUE:Int
Const GL_POINTS:Int
Const GL_LINES:Int
Const GL_LINE_LOOP:Int
Const GL_LINE_STRIP:Int
Const GL_TRIANGLES:Int
Const GL_TRIANGLE_STRIP:Int
Const GL_TRIANGLE_FAN:Int
Const GL_ZERO:Int
Const GL_ONE:Int
Const GL_SRC_COLOR:Int
Const GL_ONE_MINUS_SRC_COLOR:Int
Const GL_SRC_ALPHA:Int
Const GL_ONE_MINUS_SRC_ALPHA:Int
Const GL_DST_ALPHA:Int
Const GL_ONE_MINUS_DST_ALPHA:Int
Const GL_DST_COLOR:Int
Const GL_ONE_MINUS_DST_COLOR:Int
Const GL_SRC_ALPHA_SATURATE:Int
Const GL_FUNC_ADD:Int
Const GL_BLEND_EQUATION:Int
Const GL_BLEND_EQUATION_RGB:Int
Const GL_BLEND_EQUATION_ALPHA:Int
Const GL_FUNC_SUBTRACT:Int
Const GL_FUNC_REVERSE_SUBTRACT:Int
Const GL_BLEND_DST_RGB:Int
Const GL_BLEND_SRC_RGB:Int
Const GL_BLEND_DST_ALPHA:Int
Const GL_BLEND_SRC_ALPHA:Int
Const GL_CONSTANT_COLOR:Int
Const GL_ONE_MINUS_CONSTANT_COLOR:Int
Const GL_CONSTANT_ALPHA:Int
Const GL_ONE_MINUS_CONSTANT_ALPHA:Int
Const GL_BLEND_COLOR:Int
Const GL_ARRAY_BUFFER:Int
Const GL_ELEMENT_ARRAY_BUFFER:Int
Const GL_ARRAY_BUFFER_BINDING:Int
Const GL_ELEMENT_ARRAY_BUFFER_BINDING:Int
Const GL_STREAM_DRAW:Int
Const GL_STATIC_DRAW:Int
Const GL_DYNAMIC_DRAW:Int
Const GL_BUFFER_SIZE:Int
Const GL_BUFFER_USAGE:Int
Const GL_CURRENT_VERTEX_ATTRIB:Int
Const GL_FRONT:Int
Const GL_BACK:Int
Const GL_FRONT_AND_BACK:Int
Const GL_TEXTURE_2D:Int
Const GL_CULL_FACE:Int
Const GL_BLEND:Int
Const GL_DITHER:Int
Const GL_STENCIL_TEST:Int
Const GL_DEPTH_TEST:Int
Const GL_SCISSOR_TEST:Int
Const GL_POLYGON_OFFSET_FILL:Int
Const GL_SAMPLE_ALPHA_TO_COVERAGE:Int
Const GL_SAMPLE_COVERAGE:Int
Const GL_NO_ERROR:Int
Const GL_INVALID_ENUM:Int
Const GL_INVALID_VALUE:Int
Const GL_INVALID_OPERATION:Int
Const GL_OUT_OF_MEMORY:Int
Const GL_CW:Int
Const GL_CCW:Int
Const GL_LINE_WIDTH:Int
Const GL_ALIASED_POINT_SIZE_RANGE:Int
Const GL_ALIASED_LINE_WIDTH_RANGE:Int
Const GL_CULL_FACE_MODE:Int
Const GL_FRONT_FACE:Int
Const GL_DEPTH_RANGE:Int
Const GL_DEPTH_WRITEMASK:Int
Const GL_DEPTH_CLEAR_VALUE:Int
Const GL_DEPTH_FUNC:Int
Const GL_STENCIL_CLEAR_VALUE:Int
Const GL_STENCIL_FUNC:Int
Const GL_STENCIL_FAIL:Int
Const GL_STENCIL_PASS_DEPTH_FAIL:Int
Const GL_STENCIL_PASS_DEPTH_PASS:Int
Const GL_STENCIL_REF:Int
Const GL_STENCIL_VALUE_MASK:Int
Const GL_STENCIL_WRITEMASK:Int
Const GL_STENCIL_BACK_FUNC:Int
Const GL_STENCIL_BACK_FAIL:Int
Const GL_STENCIL_BACK_PASS_DEPTH_FAIL:Int
Const GL_STENCIL_BACK_PASS_DEPTH_PASS:Int
Const GL_STENCIL_BACK_REF:Int
Const GL_STENCIL_BACK_VALUE_MASK:Int
Const GL_STENCIL_BACK_WRITEMASK:Int
Const GL_VIEWPORT:Int
Const GL_SCISSOR_BOX:Int
Const GL_COLOR_CLEAR_VALUE:Int
Const GL_COLOR_WRITEMASK:Int
Const GL_UNPACK_ALIGNMENT:Int
Const GL_PACK_ALIGNMENT:Int
Const GL_MAX_TEXTURE_SIZE:Int
Const GL_MAX_VIEWPORT_DIMS:Int
Const GL_SUBPIXEL_BITS:Int
Const GL_RED_BITS:Int
Const GL_GREEN_BITS:Int
Const GL_BLUE_BITS:Int
Const GL_ALPHA_BITS:Int
Const GL_DEPTH_BITS:Int
Const GL_STENCIL_BITS:Int
Const GL_POLYGON_OFFSET_UNITS:Int
Const GL_POLYGON_OFFSET_FACTOR:Int
Const GL_TEXTURE_BINDING_2D:Int
Const GL_SAMPLE_BUFFERS:Int
Const GL_SAMPLES:Int
Const GL_SAMPLE_COVERAGE_VALUE:Int
Const GL_SAMPLE_COVERAGE_INVERT:Int
Const GL_NUM_COMPRESSED_TEXTURE_FORMATS:Int
Const GL_COMPRESSED_TEXTURE_FORMATS:Int
Const GL_DONT_CARE:Int
Const GL_FASTEST:Int
Const GL_NICEST:Int
Const GL_GENERATE_MIPMAP_HINT:Int
Const GL_BYTE:Int
Const GL_UNSIGNED_BYTE:Int
Const GL_SHORT:Int
Const GL_UNSIGNED_SHORT:Int
Const GL_INT:Int
Const GL_UNSIGNED_INT:Int
Const GL_FLOAT:Int
Const GL_FIXED:Int
Const GL_DEPTH_COMPONENT:Int
Const GL_ALPHA:Int
Const GL_RGB:Int
Const GL_RGBA:Int
Const GL_LUMINANCE:Int
Const GL_LUMINANCE_ALPHA:Int
Const GL_UNSIGNED_SHORT_4_4_4_4:Int
Const GL_UNSIGNED_SHORT_5_5_5_1:Int
Const GL_UNSIGNED_SHORT_5_6_5:Int
Const GL_FRAGMENT_SHADER:Int
Const GL_VERTEX_SHADER:Int
Const GL_MAX_VERTEX_ATTRIBS:Int
Const GL_MAX_VERTEX_UNIFORM_VECTORS:Int
Const GL_MAX_VARYING_VECTORS:Int
Const GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS:Int
Const GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS:Int
Const GL_MAX_TEXTURE_IMAGE_UNITS:Int
Const GL_MAX_FRAGMENT_UNIFORM_VECTORS:Int
Const GL_SHADER_TYPE:Int
Const GL_DELETE_STATUS:Int
Const GL_LINK_STATUS:Int
Const GL_VALIDATE_STATUS:Int
Const GL_ATTACHED_SHADERS:Int
Const GL_ACTIVE_UNIFORMS:Int
Const GL_ACTIVE_UNIFORM_MAX_LENGTH:Int
Const GL_ACTIVE_ATTRIBUTES:Int
Const GL_ACTIVE_ATTRIBUTE_MAX_LENGTH:Int
Const GL_SHADING_LANGUAGE_VERSION:Int
Const GL_CURRENT_PROGRAM:Int
Const GL_NEVER:Int
Const GL_LESS:Int
Const GL_EQUAL:Int
Const GL_LEQUAL:Int
Const GL_GREATER:Int
Const GL_NOTEQUAL:Int
Const GL_GEQUAL:Int
Const GL_ALWAYS:Int
Const GL_KEEP:Int
Const GL_REPLACE:Int
Const GL_INCR:Int
Const GL_DECR:Int
Const GL_INVERT:Int
Const GL_INCR_WRAP:Int
Const GL_DECR_WRAP:Int
Const GL_VENDOR:Int
Const GL_RENDERER:Int
Const GL_VERSION:Int
Const GL_EXTENSIONS:Int
Const GL_NEAREST:Int
Const GL_LINEAR:Int
Const GL_NEAREST_MIPMAP_NEAREST:Int
Const GL_LINEAR_MIPMAP_NEAREST:Int
Const GL_NEAREST_MIPMAP_LINEAR:Int
Const GL_LINEAR_MIPMAP_LINEAR:Int
Const GL_TEXTURE_MAG_FILTER:Int
Const GL_TEXTURE_MIN_FILTER:Int
Const GL_TEXTURE_WRAP_S:Int
Const GL_TEXTURE_WRAP_T:Int
Const GL_TEXTURE:Int
Const GL_TEXTURE_CUBE_MAP:Int
Const GL_TEXTURE_BINDING_CUBE_MAP:Int
Const GL_TEXTURE_CUBE_MAP_POSITIVE_X:Int
Const GL_TEXTURE_CUBE_MAP_NEGATIVE_X:Int
Const GL_TEXTURE_CUBE_MAP_POSITIVE_Y:Int
Const GL_TEXTURE_CUBE_MAP_NEGATIVE_Y:Int
Const GL_TEXTURE_CUBE_MAP_POSITIVE_Z:Int
Const GL_TEXTURE_CUBE_MAP_NEGATIVE_Z:Int
Const GL_MAX_CUBE_MAP_TEXTURE_SIZE:Int
Const GL_TEXTURE0:Int
Const GL_TEXTURE1:Int
Const GL_TEXTURE2:Int
Const GL_TEXTURE3:Int
Const GL_TEXTURE4:Int
Const GL_TEXTURE5:Int
Const GL_TEXTURE6:Int
Const GL_TEXTURE7:Int
Const GL_TEXTURE8:Int
Const GL_TEXTURE9:Int
Const GL_TEXTURE10:Int
Const GL_TEXTURE11:Int
Const GL_TEXTURE12:Int
Const GL_TEXTURE13:Int
Const GL_TEXTURE14:Int
Const GL_TEXTURE15:Int
Const GL_TEXTURE16:Int
Const GL_TEXTURE17:Int
Const GL_TEXTURE18:Int
Const GL_TEXTURE19:Int
Const GL_TEXTURE20:Int
Const GL_TEXTURE21:Int
Const GL_TEXTURE22:Int
Const GL_TEXTURE23:Int
Const GL_TEXTURE24:Int
Const GL_TEXTURE25:Int
Const GL_TEXTURE26:Int
Const GL_TEXTURE27:Int
Const GL_TEXTURE28:Int
Const GL_TEXTURE29:Int
Const GL_TEXTURE30:Int
Const GL_TEXTURE31:Int
Const GL_ACTIVE_TEXTURE:Int
Const GL_REPEAT:Int
Const GL_CLAMP_TO_EDGE:Int
Const GL_MIRRORED_REPEAT:Int
Const GL_FLOAT_VEC2:Int
Const GL_FLOAT_VEC3:Int
Const GL_FLOAT_VEC4:Int
Const GL_INT_VEC2:Int
Const GL_INT_VEC3:Int
Const GL_INT_VEC4:Int
Const GL_BOOL:Int
Const GL_BOOL_VEC2:Int
Const GL_BOOL_VEC3:Int
Const GL_BOOL_VEC4:Int
Const GL_FLOAT_MAT2:Int
Const GL_FLOAT_MAT3:Int
Const GL_FLOAT_MAT4:Int
Const GL_SAMPLER_2D:Int
Const GL_SAMPLER_CUBE:Int
Const GL_VERTEX_ATTRIB_ARRAY_ENABLED:Int
Const GL_VERTEX_ATTRIB_ARRAY_SIZE:Int
Const GL_VERTEX_ATTRIB_ARRAY_STRIDE:Int
Const GL_VERTEX_ATTRIB_ARRAY_TYPE:Int
Const GL_VERTEX_ATTRIB_ARRAY_NORMALIZED:Int
Const GL_VERTEX_ATTRIB_ARRAY_POINTER:Int
Const GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING:Int
Const GL_IMPLEMENTATION_COLOR_READ_TYPE:Int
Const GL_IMPLEMENTATION_COLOR_READ_FORMAT:Int
Const GL_COMPILE_STATUS:Int
Const GL_INFO_LOG_LENGTH:Int
Const GL_SHADER_SOURCE_LENGTH:Int
Const GL_SHADER_COMPILER:Int
Const GL_SHADER_BINARY_FORMATS:Int
Const GL_NUM_SHADER_BINARY_FORMATS:Int
Const GL_LOW_FLOAT:Int
Const GL_MEDIUM_FLOAT:Int
Const GL_HIGH_FLOAT:Int
Const GL_LOW_INT:Int
Const GL_MEDIUM_INT:Int
Const GL_HIGH_INT:Int
Const GL_FRAMEBUFFER:Int
Const GL_RENDERBUFFER:Int
Const GL_RGBA4:Int
Const GL_RGB5_A1:Int
Const GL_RGB565:Int
Const GL_DEPTH_COMPONENT16:Int
Const GL_STENCIL_INDEX:Int
Const GL_STENCIL_INDEX8:Int
Const GL_RENDERBUFFER_WIDTH:Int
Const GL_RENDERBUFFER_HEIGHT:Int
Const GL_RENDERBUFFER_INTERNAL_FORMAT:Int
Const GL_RENDERBUFFER_RED_SIZE:Int
Const GL_RENDERBUFFER_GREEN_SIZE:Int
Const GL_RENDERBUFFER_BLUE_SIZE:Int
Const GL_RENDERBUFFER_ALPHA_SIZE:Int
Const GL_RENDERBUFFER_DEPTH_SIZE:Int
Const GL_RENDERBUFFER_STENCIL_SIZE:Int
Const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE:Int
Const GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME:Int
Const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL:Int
Const GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE:Int
Const GL_COLOR_ATTACHMENT0:Int
Const GL_DEPTH_ATTACHMENT:Int
Const GL_STENCIL_ATTACHMENT:Int
Const GL_NONE:Int
Const GL_FRAMEBUFFER_COMPLETE:Int
Const GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT:Int
Const GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT:Int
Const GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS:Int
Const GL_FRAMEBUFFER_UNSUPPORTED:Int
Const GL_FRAMEBUFFER_BINDING:Int
Const GL_RENDERBUFFER_BINDING:Int
Const GL_MAX_RENDERBUFFER_SIZE:Int
Const GL_INVALID_FRAMEBUFFER_OPERATION:Int
'${END}

'${FUNCTIONS}
Function glActiveTexture:Void(texture_:GLenum)
Function glAttachShader:Void(program_:GLuint,shader_:GLuint)
Function glBindAttribLocation:Void(program_:GLuint,index_:GLuint,name_:CString)
Function glBindBuffer:Void(target_:GLenum,buffer_:GLuint)
Function glBindFramebuffer:Void(target_:GLenum,framebuffer_:GLuint)
Function glBindRenderbuffer:Void(target_:GLenum,renderbuffer_:GLuint)
Function glBindTexture:Void(target_:GLenum,texture_:GLuint)
Function glBlendColor:Void(red_:GLclampf,green_:GLclampf,blue_:GLclampf,alpha_:GLclampf)
Function glBlendEquation:Void(mode_:GLenum)
Function glBlendEquationSeparate:Void(modeRGB_:GLenum,modeAlpha_:GLenum)
Function glBlendFunc:Void(sfactor_:GLenum,dfactor_:GLenum)
Function glBlendFuncSeparate:Void(srcRGB_:GLenum,dstRGB_:GLenum,srcAlpha_:GLenum,dstAlpha_:GLenum)
Function glBufferData:Void(target_:GLenum,size_:GLsizeiptr,data_:GLvoid Ptr,usage_:GLenum)
Function glBufferSubData:Void(target_:GLenum,offset_:GLintptr,size_:GLsizeiptr,data_:GLvoid Ptr)
Function glCheckFramebufferStatus:GLenum(target_:GLenum)
Function glClear:Void(mask_:GLbitfield)
Function glClearColor:Void(red_:GLclampf,green_:GLclampf,blue_:GLclampf,alpha_:GLclampf)
Function glClearDepthf:Void(depth_:GLclampf)
Function glClearStencil:Void(s_:GLint)
Function glColorMask:Void(red_:GLboolean,green_:GLboolean,blue_:GLboolean,alpha_:GLboolean)
Function glCompileShader:Void(shader_:GLuint)
Function glCompressedTexImage2D:Void(target_:GLenum,level_:GLint,internalformat_:GLenum,width_:GLsizei,height_:GLsizei,border_:GLint,imageSize_:GLsizei,data_:GLvoid Ptr)
Function glCompressedTexSubImage2D:Void(target_:GLenum,level_:GLint,xoffset_:GLint,yoffset_:GLint,width_:GLsizei,height_:GLsizei,format_:GLenum,imageSize_:GLsizei,data_:GLvoid Ptr)
Function glCopyTexImage2D:Void(target_:GLenum,level_:GLint,internalformat_:GLenum,x_:GLint,y_:GLint,width_:GLsizei,height_:GLsizei,border_:GLint)
Function glCopyTexSubImage2D:Void(target_:GLenum,level_:GLint,xoffset_:GLint,yoffset_:GLint,x_:GLint,y_:GLint,width_:GLsizei,height_:GLsizei)
Function glCreateProgram:GLuint()
Function glCreateShader:GLuint(type_:GLenum)
Function glCullFace:Void(mode_:GLenum)
Function glDeleteBuffers:Void(n_:GLsizei,buffers_:GLuint Ptr)
Function glDeleteFramebuffers:Void(n_:GLsizei,framebuffers_:GLuint Ptr)
Function glDeleteProgram:Void(program_:GLuint)
Function glDeleteRenderbuffers:Void(n_:GLsizei,renderbuffers_:GLuint Ptr)
Function glDeleteShader:Void(shader_:GLuint)
Function glDeleteTextures:Void(n_:GLsizei,textures_:GLuint Ptr)
Function glDepthFunc:Void(func_:GLenum)
Function glDepthMask:Void(flag_:GLboolean)
Function glDepthRangef:Void(zNear_:GLclampf,zFar_:GLclampf)
Function glDetachShader:Void(program_:GLuint,shader_:GLuint)
Function glDisable:Void(cap_:GLenum)
Function glDisableVertexAttribArray:Void(index_:GLuint)
Function glDrawArrays:Void(mode_:GLenum,first_:GLint,count_:GLsizei)
Function glDrawElements:Void(mode_:GLenum,count_:GLsizei,type_:GLenum,indices_:GLvoid Ptr)
Function glEnable:Void(cap_:GLenum)
Function glEnableVertexAttribArray:Void(index_:GLuint)
Function glFinish:Void()
Function glFlush:Void()
Function glFramebufferRenderbuffer:Void(target_:GLenum,attachment_:GLenum,renderbuffertarget_:GLenum,renderbuffer_:GLuint)
Function glFramebufferTexture2D:Void(target_:GLenum,attachment_:GLenum,textarget_:GLenum,texture_:GLuint,level_:GLint)
Function glFrontFace:Void(mode_:GLenum)
Function glGenBuffers:Void(n_:GLsizei,buffers_:GLuint Ptr)
Function glGenerateMipmap:Void(target_:GLenum)
Function glGenFramebuffers:Void(n_:GLsizei,framebuffers_:GLuint Ptr)
Function glGenRenderbuffers:Void(n_:GLsizei,renderbuffers_:GLuint Ptr)
Function glGenTextures:Void(n_:GLsizei,textures_:GLuint Ptr)
Function glGetActiveAttrib:Void(program_:GLuint,index_:GLuint,bufsize_:GLsizei,length_:GLsizei Ptr,size_:GLint Ptr,type_:GLenum Ptr,name_:GLchar Ptr)

Function glGetActiveUniform:Void(program_:GLuint,index_:GLuint,bufsize_:GLsizei,length_:GLsizei Ptr,size_:GLint Ptr,type_:UInt Ptr,name_:GLchar Ptr)

Function glGetAttachedShaders:Void(program_:GLuint,maxcount_:GLsizei,count_:GLsizei Ptr,shaders_:GLuint Ptr)
Function glGetAttribLocation:int(program_:GLuint,name_:CString)
Function glGetBooleanv:Void(pname_:GLenum,params_:GLboolean Ptr)
Function glGetBufferParameteriv:Void(target_:GLenum,pname_:GLenum,params_:GLint Ptr)
Function glGetError:GLenum()
Function glGetFloatv:Void(pname_:GLenum,params_:GLfloat Ptr)
Function glGetFramebufferAttachmentParameteriv:Void(target_:GLenum,attachment_:GLenum,pname_:GLenum,params_:GLint Ptr)
Function glGetIntegerv:Void(pname_:GLenum,params_:GLint Ptr)
Function glGetProgramiv:Void(program_:GLuint,pname_:GLenum,params_:GLint Ptr)
Function glGetProgramInfoLog:Void(program_:GLuint,bufsize_:GLsizei,length_:GLsizei Ptr,infolog_:GLchar Ptr )
Function glGetRenderbufferParameteriv:Void(target_:GLenum,pname_:GLenum,params_:GLint Ptr)
Function glGetShaderiv:Void(shader_:GLuint,pname_:GLenum,params_:GLint Ptr)
Function glGetShaderInfoLog:Void(shader_:GLuint,bufsize_:GLsizei,length_:GLsizei Ptr,infolog_:GLchar Ptr )
Function glGetShaderPrecisionFormat:Void(shadertype_:GLenum,precisiontype_:GLenum,range_:GLint Ptr,precision_:GLint Ptr)
Function glGetShaderSource:Void(shader_:GLuint,bufsize_:GLsizei,length_:GLsizei Ptr,source_:CString)
Function glGetString:GLubyte Ptr(name_:GLenum)
Function glGetTexParameterfv:Void(target_:GLenum,pname_:GLenum,params_:GLfloat Ptr)
Function glGetTexParameteriv:Void(target_:GLenum,pname_:GLenum,params_:GLint Ptr)
Function glGetUniformfv:Void(program_:GLuint,location_:GLint,params_:GLfloat Ptr)
Function glGetUniformiv:Void(program_:GLuint,location_:GLint,params_:GLint Ptr)
Function glGetUniformLocation:Int(program_:GLuint,name_:CString)
Function glGetVertexAttribfv:Void(index_:GLuint,pname_:GLenum,params_:GLfloat Ptr)
Function glGetVertexAttribiv:Void(index_:GLuint,pname_:GLenum,params_:GLint Ptr)
Function glGetVertexAttribPointerv:Void(index_:GLuint,pname_:GLenum,pointer_:GLvoid Ptr Ptr)
Function glHint:Void(target_:GLenum,mode_:GLenum)
Function glIsBuffer:GLboolean(buffer_:GLuint)
Function glIsEnabled:GLboolean(cap_:GLenum)
Function glIsFramebuffer:GLboolean(framebuffer_:GLuint)
Function glIsProgram:GLboolean(program_:GLuint)
Function glIsRenderbuffer:GLboolean(renderbuffer_:GLuint)
Function glIsShader:GLboolean(shader_:GLuint)
Function glIsTexture:GLboolean(texture_:GLuint)
Function glLineWidth:Void(width_:GLfloat)
Function glLinkProgram:Void(program_:GLuint)
Function glPixelStorei:Void(pname_:GLenum,param_:GLint)
Function glPolygonOffset:Void(factor_:GLfloat,units_:GLfloat)
Function glReadPixels:Void(x_:GLint,y_:GLint,width_:GLsizei,height_:GLsizei,format_:GLenum,type_:GLenum,pixels_:GLvoid Ptr)
Function glReleaseShaderCompiler:Void()
Function glRenderbufferStorage:Void(target_:GLenum,internalformat_:GLenum,width_:GLsizei,height_:GLsizei)
Function glSampleCoverage:Void(value_:GLclampf,invert_:GLboolean)
Function glScissor:Void(x_:GLint,y_:GLint,width_:GLsizei,height_:GLsizei)
Function glShaderBinary:Void(n_:GLsizei,shaders_:GLuint Ptr,binaryformat_:GLenum,binary_:GLvoid Ptr,length_:GLsizei)
Function glShaderSource:Void(shader_:GLuint,count_:GLsizei,string_:GLcchar Ptr Ptr,length_:GLint Ptr)
Function glStencilFunc:Void(func_:GLenum,ref_:GLint,mask_:GLuint)
Function glStencilFuncSeparate:Void(face_:GLenum,func_:GLenum,ref_:GLint,mask_:GLuint)
Function glStencilMask:Void(mask_:GLuint)
Function glStencilMaskSeparate:Void(face_:GLenum,mask_:GLuint)
Function glStencilOp:Void(fail_:GLenum,zfail_:GLenum,zpass_:GLenum)
Function glStencilOpSeparate:Void(face_:GLenum,fail_:GLenum,zfail_:GLenum,zpass_:GLenum)
Function glTexImage2D:Void(target_:GLenum,level_:GLint,internalformat_:GLint,width_:GLsizei,height_:GLsizei,border_:GLint,format_:GLenum,type_:GLenum,pixels_:GLvoid Ptr)
Function glTexParameterf:Void(target_:GLenum,pname_:GLenum,param_:GLfloat)
Function glTexParameterfv:Void(target_:GLenum,pname_:GLenum,params_:GLfloat Ptr)
Function glTexParameteri:Void(target_:GLenum,pname_:GLenum,param_:GLint)
Function glTexParameteriv:Void(target_:GLenum,pname_:GLenum,params_:GLint Ptr)
Function glTexSubImage2D:Void(target_:GLenum,level_:GLint,xoffset_:GLint,yoffset_:GLint,width_:GLsizei,height_:GLsizei,format_:GLenum,type_:GLenum,pixels_:GLvoid Ptr)
Function glUniform1f:Void(location_:GLint,x_:GLfloat)
Function glUniform1fv:Void(location_:GLint,count_:GLsizei,v_:GLfloat Ptr)
Function glUniform1i:Void(location_:GLint,x_:GLint)
Function glUniform1iv:Void(location_:GLint,count_:GLsizei,v_:GLint Ptr)
Function glUniform2f:Void(location_:GLint,x_:GLfloat,y_:GLfloat)
Function glUniform2fv:Void(location_:GLint,count_:GLsizei,v_:GLfloat Ptr)
Function glUniform2i:Void(location_:GLint,x_:GLint,y_:GLint)
Function glUniform2iv:Void(location_:GLint,count_:GLsizei,v_:GLint Ptr)
Function glUniform3f:Void(location_:GLint,x_:GLfloat,y_:GLfloat,z_:GLfloat)
Function glUniform3fv:Void(location_:GLint,count_:GLsizei,v_:GLfloat Ptr)
Function glUniform3i:Void(location_:GLint,x_:GLint,y_:GLint,z_:GLint)
Function glUniform3iv:Void(location_:GLint,count_:GLsizei,v_:GLint Ptr)
Function glUniform4f:Void(location_:GLint,x_:GLfloat,y_:GLfloat,z_:GLfloat,w_:GLfloat)
Function glUniform4fv:Void(location_:GLint,count_:GLsizei,v_:GLfloat Ptr)
Function glUniform4i:Void(location_:GLint,x_:GLint,y_:GLint,z_:GLint,w_:GLint)
Function glUniform4iv:Void(location_:GLint,count_:GLsizei,v_:GLint Ptr)
Function glUniformMatrix2fv:Void(location_:GLint,count_:GLsizei,transpose_:GLboolean,value_:GLfloat Ptr)
Function glUniformMatrix3fv:Void(location_:GLint,count_:GLsizei,transpose_:GLboolean,value_:GLfloat Ptr)
Function glUniformMatrix4fv:Void(location_:GLint,count_:GLsizei,transpose_:GLboolean,value_:GLfloat Ptr)
Function glUseProgram:Void(program_:GLuint)
Function glValidateProgram:Void(program_:GLuint)
Function glVertexAttrib1f:Void(indx_:GLuint,x_:GLfloat)
Function glVertexAttrib1fv:Void(indx_:GLuint,values_:GLfloat Ptr)
Function glVertexAttrib2f:Void(indx_:GLuint,x_:GLfloat,y_:GLfloat)
Function glVertexAttrib2fv:Void(indx_:GLuint,values_:GLfloat Ptr)
Function glVertexAttrib3f:Void(indx_:GLuint,x_:GLfloat,y_:GLfloat,z_:GLfloat)
Function glVertexAttrib3fv:Void(indx_:GLuint,values_:GLfloat Ptr)
Function glVertexAttrib4f:Void(indx_:GLuint,x_:GLfloat,y_:GLfloat,z_:GLfloat,w_:GLfloat)
Function glVertexAttrib4fv:Void(indx_:GLuint,values_:GLfloat Ptr)
Function glVertexAttribPointer:Void(indx_:GLuint,size_:GLint,type_:GLenum,normalized_:GLboolean,stride_:GLsizei,ptr_:GLvoid Ptr)
Function glViewport:Void(x_:GLint,y_:GLint,width_:GLsizei,height_:GLsizei)
'${END}

#If __TARGET__="desktop" And __HOSTOS__="windows"
Function bb_gles20_windows_init()
#Endif

Public

'Must call this after creating context...
'
Function glInitEx()
	#If __TARGET__="desktop" And __HOSTOS__="windows"
'		bb_gles20_windows_init()
	#Endif
End

'Saner versions of some string functions...
'
Function glShaderSourceEx:Void( shader:GLuint,source:String )

	Local n:=source.Length
	Local buf:=Cast<Byte Ptr>( libc.malloc( n+1 ) )
	For Local i:=0 Until n
		buf[i]=source[i]
	Next
	buf[n]=0
	
	Local p:=Cast<GLcchar Ptr>( buf )
	
	glShaderSource( shader,1,Varptr p,Null )
	
	libc.free( buf )
End

Function glGetShaderInfoLogEx:String( shader:GLuint )

	Local buf:=New Byte[1024],length:GLsizei
	
	glGetShaderInfoLog( shader,buf.Length,Varptr length,Cast<GLchar Ptr>( Varptr buf[0] ) )
	
	Return String.FromCString( Varptr buf[0] )
End

Function glGetProgramInfoLogEx:String( program:GLuint )

	Local buf:=New Byte[1024],length:GLsizei
	
	glGetProgramInfoLog( program,buf.Length,Varptr length,Cast<GLchar Ptr>( Varptr buf[0] ) )
	
	Return String.FromCString( Varptr buf[0] )
End
