/*
* This file was generated with gl3w_gen.py, part of gl3w
* (hosted at https://github.com/skaslev/gl3w)
*
* This is free and unencumbered software released into the public domain.
*
* Anyone is free to copy, modify, publish, use, compile, sell, or
* distribute this software, either in source code form or as a compiled
* binary, for any purpose, commercial or non-commercial, and by any
* means.
*
* In jurisdictions that recognize copyright laws, the author or authors
* of this software dedicate any and all copyright interest in the
* software to the public domain. We make this dedication for the benefit
* of the public at large and to the detriment of our heirs and
* successors. We intend this dedication to be an overt act of
* relinquishment in perpetuity of all present and future rights to this
* software under copyright law.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
* IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/

#ifndef GL3W_H
#define GL3W_H

#ifndef __gl_h_
// Define __gl_h_ so that the "real" GL header will not be included
#define __gl_h_ // NOLINT(bugprone-reserved-identifier)
#endif

#include "GL/glcorearb.h"
#undef GL_VERSION_1_3
#undef GL_VERSION_1_4
#undef GL_VERSION_3_1
#undef GL_VERSION_3_3
#undef GL_ARB_imaging
#undef GL_ARB_robustness
#undef GL_NV_path_rendering
#undef GL_VERSION_4_5
#include "GL/glext.h"

#ifndef GL3W_API
#define GL3W_API
#endif

#ifdef __cplusplus
extern "C" {
#endif

// Operation successful
#define GL3W_OK 0
// Failed initialising the OpenGL library as it is missing critical symbols
#define GL3W_ERROR_INIT (-1)
// Error opening the OpenGL shared library
#define GL3W_ERROR_LIBRARY_OPEN (-2)
// Error closing the OpenGL shared library
#define GL3W_ERROR_LIBRARY_CLOSE (-3)
// The OpenGL library does not meet the minimum version requirements specified when invoking gl3wInit
#define GL3W_ERROR_OPENGL_VERSION (-4)

typedef void (*GL3WglProc)();
typedef GL3WglProc (*GL3WGetProcAddressProc)(const char* proc);

/**
* Initializes the library. Should be called once after an OpenGL context has been created.
*
* @return GL3W_OK on success, GL3W_ERROR_OPENGL_VERSION if minimum version (specified at build time) failed to be met, GL3W_ERROR_LIBRARY_CLOSE if the wrapper was already initialized and failed to be disposed, GL3W_ERROR_INIT if the library is missing critical symbols
*/
GL3W_API int gl3wInit(void);

/**
* Dispose the wrapper.
* This involves zeroing the function lookup table and unloading the shared library if loaded.
*
* @return GL3W_OK on success, GL3W_ERROR_LIBRARY_CLOSE on error. (Invoke gl3wError() to get a more detailed error message.)
*/
GL3W_API int gl3wDispose(void);

/**
* Return a string describing the last error or NULL if the last gl3w library call succeeded.
*
* @return a string describing the last ERROR or NULL if the last gl3w library call succeeded.
*/
GL3W_API const char* gl3wError(void);

/**
* Return true if the OpenGL library meets the versions specified.
*
* @param min_major the minimum major version required.
* @param min_minor the minimum minor version required.
* @return a string describing the last ERROR or NULL if the last gl3w library call succeeded.
*/
GL3W_API bool gl3wIsSupported(int min_major, int min_minor);

/**
* Returns the address of an OpenGL extension function. Generally, you won't need to use it since gl3w loads all
* functions defined in the OpenGL core profile on initialization. It allows you to load OpenGL extensions
* outside of the core profile.

* @param proc the name of the extension function.
* @return the address of the extension function or NULL if no such extension method available. If NULL is returned the invoker should call gl3wError to ensure there was no actual error.
*/
GL3W_API GL3WglProc gl3wGetProcAddress(const char* proc);

GL3W_PROCS_DEFINITION;

#ifdef GL3W_IMPLEMENTATION
#include <stdlib.h>
#include <stdbool.h>

#define GL3W_MAX_ERROR_MESSAGE_LENGTH 1024
static char gl3w_error_buffer[GL3W_MAX_ERROR_MESSAGE_LENGTH] = { 0 };
static char* gl3w_error = NULL;

#define COUNT_OF(x) (sizeof(x) / sizeof((x)[0]))

#if defined(_WIN32)
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN 1
#endif
#include <windows.h>

static HMODULE gl3w_libgl_handle = NULL;
typedef PROC(__stdcall* GL3WglGetProcAddr)(LPCSTR);
static GL3WglGetProcAddr wgl_get_proc_address = NULL;

static void gl3w_close_libgl()
{
   if (NULL != gl3w_libgl_handle) {
       FreeLibrary(gl3w_libgl_handle);
       gl3w_libgl_handle = NULL;
       wgl_get_proc_address = NULL;
   }
}

static int gl3w_open_libgl()
{
   gl3w_libgl_handle = LoadLibraryA("opengl32.dll");
   if (NULL == gl3w_libgl_handle) {
       return GL3W_ERROR_LIBRARY_OPEN;
   } else {
       wgl_get_proc_address = (GL3WglGetProcAddr)GetProcAddress(gl3w_libgl_handle, "wglGetProcAddress");
       return GL3W_OK;
   }
}

static GL3WglProc gl3w_get_proc(const char* proc)
{
   GL3WglProc res = (GL3WglProc)wgl_get_proc_address(proc);
   if (NULL == res) {
       res = (GL3WglProc)GetProcAddress(gl3w_libgl_handle, proc);
   } else {
       return res;
   }
}
#elif defined(__APPLE__)
#include <dlfcn.h>
#include <stdio.h>

static void* gl3w_libgl_handle = NULL;

static int gl3w_open_libgl(void)
{
   gl3w_libgl_handle = dlopen("/System/Library/Frameworks/OpenGL.framework/OpenGL", RTLD_LAZY | RTLD_LOCAL);
   if (NULL == gl3w_libgl_handle) {
       const char* error_message = dlerror();
       snprintf(gl3w_error_buffer, GL3W_MAX_ERROR_MESSAGE_LENGTH, "Error loading OpenGL framework: %s", error_message);
       gl3w_error = gl3w_error_buffer;
       return GL3W_ERROR_LIBRARY_OPEN;
   } else {
       return GL3W_OK;
   }
}

static void gl3w_close_libgl()
{
   void* gl = gl3w_libgl_handle;
   gl3w_libgl_handle = NULL;
   if (NULL != gl) {
       const int result = dlclose(gl);
       if (0 != result) {
           const char* error_message = dlerror();
           snprintf(gl3w_error_buffer, GL3W_MAX_ERROR_MESSAGE_LENGTH, "Error unloading OpenGL framework: %s", error_message);
           gl3w_error = gl3w_error_buffer;
       }
   }
}

static GL3WglProc gl3w_get_proc(const char* proc)
{
   GL3WglProc res;
   *(void**)(&res) = dlsym(gl3w_libgl_handle, proc);
   if (NULL == res) {
       const char* error_message = dlerror();
       if (NULL != error_message) {
           snprintf(gl3w_error_buffer, GL3W_MAX_ERROR_MESSAGE_LENGTH, "Error retrieving OpenGL symbol %s: %s\n", proc, error_message);
           gl3w_error = gl3w_error_buffer;
           printf(gl3w_error);
       } else {
           printf("Failed to lookup symbol %s\n", proc);
       }
   } else {
       printf("Found symbol %s\n", proc);
   }
   return res;
}
#else
#include <dlfcn.h>

// OpenGL library
static void* gl3w_libgl_handle = NULL;
// GLX library
static void* gl3w_libglx_handle = NULL;
// EGL library
static void* gl3w_libegl_handle = NULL;
static GL3WGetProcAddressProc gl3w_get_proc_address = NULL;

static void gl3w_close_libgl()
{
   if (NULL != gl3w_libgl_handle) {
       dlclose(gl3w_libgl_handle);
       gl3w_libgl_handle = NULL;
   }
   if (NULL != gl3w_libegl_handle) {
       dlclose(gl3w_libegl_handle);
       gl3w_libegl_handle = NULL;
   }
   if (NULL != gl3w_libglx_handle) {
       dlclose(gl3w_libglx_handle);
       gl3w_libglx_handle = NULL;
   }
}

static int gl3w_is_library_loaded(const char* name, void** lib)
{
   *lib = dlopen(name, RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
   dlerror() return NULL != *lib;
}

static int gl3w_open_libs()
{
   // On Linux we have two APIs to get process addresses: EGL and GLX.
   // EGL is supported under both X11 and Wayland, whereas GLX is X11-specific.
   // First check what's already loaded, the windowing library might have
   // already loaded either EGL or GLX and we want to use the same one.

   if (gl3w_is_library_loaded("libEGL.so.1", &gl3w_libegl_handle) || gl3w_is_library_loaded("libGLX.so.0", &gl3w_libglx_handle)) {
       gl3w_libgl_handle = dlopen("libOpenGL.so.0", RTLD_LAZY | RTLD_LOCAL);
       if (NULL != gl3w_libgl_handle) {
           return GL3W_OK;
       } else {
           gl3w_close_libgl();
       }
   }

   if (gl3w_is_library_loaded("libGL.so.1", &gl3w_libgl_handle)) {
       return GL3W_OK;
   } else {
       // Neither is already loaded, so we have to load one. Try EGL first
       // because it is supported under both X11 and Wayland.

       // Load OpenGL + EGL
       gl3w_libgl_handle = dlopen("libOpenGL.so.0", RTLD_LAZY | RTLD_LOCAL);
       gl3w_libegl_handle = dlopen("libEGL.so.1", RTLD_LAZY | RTLD_LOCAL);
       if (NULL != gl3w_libgl_handle && NULL != gl3w_libegl_handle) {
           return GL3W_OK;
       } else {
           // Fall back to legacy libGL, which includes GLX
           gl3w_close_libgl();
           gl3w_libgl_handle = dlopen("libGL.so.1", RTLD_LAZY | RTLD_LOCAL);
           return NULL != gl3w_libgl_handle ? GL3W_OK : GL3W_ERROR_LIBRARY_OPEN;
       }
   }
}

static int gl3w_open_libgl()
{
   const int open_result = gl3w_open_libs();
   if (GL3W_OK != open_result) {
       return open_result;
   } else {
       if (gl3w_libegl_handle) {
           *(void**)(&gl3w_get_proc_address) = dlsym(gl3w_libegl_handle, "eglGetProcAddress");
       } else if (gl3w_libglx_handle) {
           *(void**)(&gl3w_get_proc_address) = dlsym(gl3w_libglx_handle, "glXGetProcAddressARB");
       } else {
           *(void**)(&gl3w_get_proc_address) = dlsym(gl3w_libgl_handle, "glXGetProcAddressARB");
       }

       if (!gl3w_get_proc_address) {
           gl3w_close_libgl();
           return GL3W_ERROR_INIT;
       } else {
           return GL3W_OK;
       }
   }
}

static GL3WglProc gl3w_get_proc(const char* proc)
{
   // Before EGL version 1.5, eglGetProcAddress doesn't support querying core
   // functions and may return a dummy function if we try, so try to load the
   // function from the GL library directly first.

   GL3WglProc res = NULL;
   if (gl3w_libegl_handle) {
       *(void**)(&res) = dlsym(gl3w_libgl_handle, proc);
   }
   if (NULL == res) {
       res = gl3w_get_proc_address(proc);
   }
   if (!gl3w_libegl_handle && !res) {
       *(void**)(&res) = dlsym(gl3w_libgl_handle, proc);
   }
   return res;
}
#endif

GL3W_PROC_NAMES;

union GL3WProcs gl3wProcs;

static void load_procs(const GL3WGetProcAddressProc proc)
{
   for (size_t i = 0; i < COUNT_OF(gl3w_proc_names); i++) {
       gl3wProcs.ptr[i] = proc(gl3w_proc_names[i]);
   }
}

static void unload_procs()
{
   for (size_t i = 0; i < COUNT_OF(gl3w_proc_names); i++) {
       gl3wProcs.ptr[i] = NULL;
   }
}

static bool gl3w_is_version(const int min_major, const int min_minor)
{
    int major;
    int minor;
    glGetIntegerv(GL_MAJOR_VERSION, &major);
    glGetIntegerv(GL_MINOR_VERSION, &minor);

    if (min_major == major) {
        return min_minor >= minor ? true : false;
    } else {
        return min_major >= major ? true : false;
    }
}

static bool gl3w_close_libgl_atexit_registered = false;

int gl3wInit()
{
   gl3w_error = NULL;
   const int dispose_result = gl3wDispose();
   if (GL3W_OK != dispose_result) {
       return dispose_result;
   } else {
       const int open_result = gl3w_open_libgl();
       if (GL3W_OK != open_result) {
           return open_result;
       } else {
           if (false == gl3w_close_libgl_atexit_registered) {
               if (0 == atexit(gl3w_close_libgl)) {
                   gl3w_close_libgl_atexit_registered = true;
               }
           }
           load_procs(gl3w_get_proc);
           if (!glGetIntegerv) {
               gl3wDispose();
               return GL3W_ERROR_INIT;
           } else if (gl3w_is_version(GL3W_MIN_MAJOR_VERSION, GL3W_MIN_MINOR_VERSION)) {
               gl3wDispose();
               return GL3W_ERROR_OPENGL_VERSION;
           } else {
               return GL3W_OK;
           }
       }
   }
}

int gl3wDispose()
{
   gl3w_error = NULL;
   unload_procs();
   gl3w_close_libgl();
   return NULL == gl3w_error ? GL3W_OK : GL3W_ERROR_LIBRARY_CLOSE;
}

const char* gl3wError()
{
   return gl3w_error;
}

bool gl3wIsSupported(const int min_major, const int min_minor)
{
   if (!glGetIntegerv) {
       gl3w_error = "gl3wIsSupported(...) invoked without successfully invoking gl3wInit(...)";
       return false;
   } else {
       return gl3w_is_version(min_major, min_minor);
   }
}

GL3WglProc gl3wGetProcAddress(const char* proc)
{
   gl3w_error = NULL;
   return gl3w_get_proc(proc);
}

#endif // GL3W_IMPLEMENTATION

#ifdef __cplusplus
}
#endif

#endif
