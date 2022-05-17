/*
 * This file was generated with gla_generator.py, part of gla
 * (hosted at https://github.com/skaslev/gla)
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

#ifndef GLA_H
#define GLA_H

#ifndef __gl_h_
// Define __gl_h_ so that the "real" GL header will not be included
#define __gl_h_ // NOLINT(bugprone-reserved-identifier)
#endif

GLA_INCLUDES_CONTENT;

#include <stdbool.h>

#ifndef GLA_API
#define GLA_API
#endif

#ifdef __cplusplus
extern "C" {
#endif

// Operation successful
#define GLA_OK 0
// Failed initialising the OpenGL library as it is missing critical symbols
#define GLA_ERROR_INIT (-1)
// Error opening the OpenGL shared library
#define GLA_ERROR_LIBRARY_OPEN (-2)
// Error closing the OpenGL shared library
#define GLA_ERROR_LIBRARY_CLOSE (-3)
// The OpenGL library does not meet the minimum version requirements specified when invoking glaInit
#define GLA_ERROR_OPENGL_VERSION (-4)

/**
 * Initializes the library. Should be called once after an OpenGL context has been created.
 *
 * @return GLA_OK on success, GLA_ERROR_OPENGL_VERSION if minimum version (specified at build time) failed to be met, GLA_ERROR_LIBRARY_CLOSE if the wrapper was already initialized and failed to be disposed, GLA_ERROR_INIT if the library is missing critical symbols
 */
GLA_API int glaInit(void);

/**
 * Dispose the wrapper.
 * This involves zeroing the function lookup table and unloading the shared library if loaded.
 *
 * @return GLA_OK on success, GLA_ERROR_LIBRARY_CLOSE on error. (Invoke glaError() to get a more detailed error message.)
 */
GLA_API int glaDispose(void);

/**
 * Return a string describing the last error or NULL if the last gla library call succeeded.
 *
 * @return a string describing the last ERROR or NULL if the last gla library call succeeded.
 */
GLA_API const char* glaError(void);

#ifdef GLA_AUTO_CHECK_ERROR_HANDLER
void glaCheckError(const char* statement, const char* filename, int line);

#define GLA_CHECK(statement)                           \
    do {                                               \
        statement;                                     \
        glaCheckError(#statement, __FILE__, __LINE__); \
    } while (0)
#else
#define GLA_CHECK(statement) statement
#endif

/**
 * Convert the specified error code into an error message if possible.
 *
 * @param error_code the error code.
 * @return the associated error message if it can be determined or NULL.
 */
const char* glaErrorCodeToMessage(GLenum error_code);

typedef void (*GLAglFunction)();

GLA_INTERFACE_CONTENT;

#ifdef GLA_IMPLEMENTATION
#include <stdlib.h>

typedef GLAglFunction (*GLAGetProcAddressProc)(const char* function_name);

#define GLA_MAX_ERROR_MESSAGE_LENGTH 1024
static char gla_error_buffer[GLA_MAX_ERROR_MESSAGE_LENGTH] = { 0 };
static char* gla_error = NULL;
static int gla_major_version = 0;
static int gla_minor_version = 0;

union GLAFunctions glaFunctions;

#define COUNT_OF(x) (sizeof(x) / sizeof((x)[0]))

#if defined(_WIN32)
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN 1
#endif
#include <windows.h>

static HMODULE gla_libgl_handle = NULL;
typedef PROC(__stdcall* GLAglGetProcAddr)(LPCSTR);
static GLAglGetProcAddr wgl_get_proc_address = NULL;

static void gla_close_libgl()
{
    if (NULL != gla_libgl_handle) {
        FreeLibrary(gla_libgl_handle);
        gla_libgl_handle = NULL;
        wgl_get_proc_address = NULL;
    }
}

static int gla_open_libgl()
{
    gla_libgl_handle = LoadLibraryA("opengl32.dll");
    if (NULL == gla_libgl_handle) {
        return GLA_ERROR_LIBRARY_OPEN;
    } else {
        wgl_get_proc_address = (GLAglGetProcAddr)GetProcAddress(gla_libgl_handle, "wglGetProcAddress");
        return GLA_OK;
    }
}

static GLAglFunction gla_get_function(const char* function_name)
{
    GLAglFunction function = (GLAglFunction)wgl_get_proc_address(function_name);
    if (NULL == function) {
        return (GLAglFunction)GetProcAddress(gla_libgl_handle, function_name);
    } else {
        return function;
    }
}
#elif defined(__APPLE__)
#include <dlfcn.h>
#include <stdio.h>

static void* gla_libgl_handle = NULL;

static int gla_open_libgl(void)
{
    gla_libgl_handle = dlopen("/System/Library/Frameworks/OpenGL.framework/OpenGL", RTLD_LAZY | RTLD_LOCAL);
    if (NULL == gla_libgl_handle) {
        const char* error_message = dlerror();
        snprintf(gla_error_buffer, GLA_MAX_ERROR_MESSAGE_LENGTH, "Error loading OpenGL framework: %s", error_message);
        gla_error = gla_error_buffer;
        return GLA_ERROR_LIBRARY_OPEN;
    } else {
        return GLA_OK;
    }
}

static void gla_close_libgl()
{
    void* gl = gla_libgl_handle;
    gla_libgl_handle = NULL;
    if (NULL != gl) {
        const int result = dlclose(gl);
        if (0 != result) {
            const char* error_message = dlerror();
            snprintf(gla_error_buffer, GLA_MAX_ERROR_MESSAGE_LENGTH, "Error unloading OpenGL framework: %s", error_message);
            gla_error = gla_error_buffer;
        }
    }
}

static GLAglFunction gla_get_function(const char* function_name)
{
    return (GLAglFunction)dlsym(gla_libgl_handle, function_name);
}
#else
#include <dlfcn.h>

// OpenGL library
static void* gla_libgl_handle = NULL;
// GLX library
static void* gla_libglx_handle = NULL;
// EGL library
static void* gla_libegl_handle = NULL;
static GLAGetProcAddressProc gla_get_function_address = NULL;

static void gla_close_libgl()
{
    if (NULL != gla_libgl_handle) {
        dlclose(gla_libgl_handle);
        gla_libgl_handle = NULL;
    }
    if (NULL != gla_libegl_handle) {
        dlclose(gla_libegl_handle);
        gla_libegl_handle = NULL;
    }
    if (NULL != gla_libglx_handle) {
        dlclose(gla_libglx_handle);
        gla_libglx_handle = NULL;
    }
}

static int gla_is_library_loaded(const char* name, void** lib)
{
    *lib = dlopen(name, RTLD_LAZY | RTLD_LOCAL | RTLD_NOLOAD);
    dlerror() return NULL != *lib;
}

static int gla_open_libs()
{
    // On Linux we have two APIs to get process addresses: EGL and GLX.
    // EGL is supported under both X11 and Wayland, whereas GLX is X11-specific.
    // First check what's already loaded, the windowing library might have
    // already loaded either EGL or GLX and we want to use the same one.

    if (gla_is_library_loaded("libEGL.so.1", &gla_libegl_handle) || gla_is_library_loaded("libGLX.so.0", &gla_libglx_handle)) {
        gla_libgl_handle = dlopen("libOpenGL.so.0", RTLD_LAZY | RTLD_LOCAL);
        if (NULL != gla_libgl_handle) {
            return GLA_OK;
        } else {
            gla_close_libgl();
        }
    }

    if (gla_is_library_loaded("libGL.so.1", &gla_libgl_handle)) {
        return GLA_OK;
    } else {
        // Neither is already loaded, so we have to load one. Try EGL first
        // because it is supported under both X11 and Wayland.

        // Load OpenGL + EGL
        gla_libgl_handle = dlopen("libOpenGL.so.0", RTLD_LAZY | RTLD_LOCAL);
        gla_libegl_handle = dlopen("libEGL.so.1", RTLD_LAZY | RTLD_LOCAL);
        if (NULL != gla_libgl_handle && NULL != gla_libegl_handle) {
            return GLA_OK;
        } else {
            // Fall back to legacy libGL, which includes GLX
            gla_close_libgl();
            gla_libgl_handle = dlopen("libGL.so.1", RTLD_LAZY | RTLD_LOCAL);
            return NULL != gla_libgl_handle ? GLA_OK : GLA_ERROR_LIBRARY_OPEN;
        }
    }
}

static int gla_open_libgl()
{
    const int open_result = gla_open_libs();
    if (GLA_OK != open_result) {
        return open_result;
    } else {
        if (gla_libegl_handle) {
            *(void**)(&gla_get_function_address) = dlsym(gla_libegl_handle, "eglGetProcAddress");
        } else if (gla_libglx_handle) {
            *(void**)(&gla_get_function_address) = dlsym(gla_libglx_handle, "glXGetProcAddressARB");
        } else {
            *(void**)(&gla_get_function_address) = dlsym(gla_libgl_handle, "glXGetProcAddressARB");
        }

        if (!gla_get_function_address) {
            gla_close_libgl();
            return GLA_ERROR_INIT;
        } else {
            return GLA_OK;
        }
    }
}

static GLAglFunction gla_get_function(const char* function_name)
{
    // Before EGL version 1.5, eglGetProcAddress doesn't support querying core
    // functions and may return a dummy function if we try, so try to load the
    // function from the GL library directly first.

    GLAglFunction res = NULL;
    if (gla_libegl_handle) {
        *(void**)(&res) = dlsym(gla_libgl_handle, function_name);
    }
    if (NULL == res) {
        res = gla_get_function_address(function_name);
    }
    if (!gla_libegl_handle && !res) {
        *(void**)(&res) = dlsym(gla_libgl_handle, function_name);
    }
    return res;
}
#endif

GLA_IMPL_CONTENT;

static void reset_functions()
{
    for (size_t i = 0; i < COUNT_OF(gla_functions); i++) {
        glaFunctions.functions[i] = NULL;
    }
}

static bool load_functions(const GLAGetProcAddressProc proc)
{
    for (size_t i = 0; i < COUNT_OF(gla_functions); i++) {
        glaFunctions.functions[i] = proc(gla_functions[i].name);
        if (NULL == glaFunctions.functions[i] /*&& gla_functions[i].required*/) {
            snprintf(gla_error_buffer, GLA_MAX_ERROR_MESSAGE_LENGTH, "Failed to load required OpenGL function: %s", gla_functions[i].name);
            gla_error = gla_error_buffer;
            return false;
        }
    }
    return true;
}

#ifdef GLFW_SUPPORT_EXTENSIONS

union GLAExtensions glaExtensions;

static void reset_extensions()
{
    for (int j = 0; j < COUNT_OF(gla_extension_names); j++) {
        glaExtensions.extensions[j] = false;
    }
}

static void detect_extensions()
{
    reset_extensions();

    int extension_count = 0;
    glGetIntegerv(GL_NUM_EXTENSIONS, &extension_count);
    for (int i = 0; i < extension_count; i++) {
        const GLubyte* extension_name = glGetStringi(GL_EXTENSIONS, i);
        for (int j = 0; j < COUNT_OF(gla_extension_names); j++) {
            if (0 == strcmp(gla_extension_names[j], extension_name)) {
                glaExtensions.extensions[j] = true;
            }
        }
    }
}

#endif

static bool gla_is_version(const int min_major, const int min_minor)
{
    return min_major == gla_major_version ? min_minor >= gla_minor_version : min_major >= gla_major_version;
}

#ifdef GLFW_SUPPORT_OPTIONAL_VERSIONS

union GLAVersions glaVersions;

static void reset_versions()
{
    for (size_t i = 0; i < COUNT_OF(gla_versions); i++) {
        glaVersions.versions[i] = false;
    }
}

static void detect_versions()
{
    reset_versions();

    for (size_t i = 0; i < COUNT_OF(gla_versions); i++) {
        glaVersions.versions[i] = gla_is_version(gla_versions[i].major, gla_versions[i].minor);
    }
}

#endif

static bool gla_close_libgl_atexit_registered = false;

int glaInit()
{
    gla_error = NULL;
    const int dispose_result = glaDispose();
    if (GLA_OK != dispose_result) {
        return dispose_result;
    } else {
        const int open_result = gla_open_libgl();
        if (GLA_OK != open_result) {
            return open_result;
        } else {
            if (false == gla_close_libgl_atexit_registered) {
                if (0 == atexit(gla_close_libgl)) {
                    gla_close_libgl_atexit_registered = true;
                }
            }
            load_functions(gla_get_function);
            if (NULL == glaFunctions.function.GetIntegerv) {
                glaDispose();
                return GLA_ERROR_INIT;
            } else {
                glGetIntegerv(GL_MAJOR_VERSION, &gla_major_version);
                glGetIntegerv(GL_MINOR_VERSION, &gla_minor_version);

                if (gla_is_version(GLA_MIN_MAJOR_VERSION, GLA_MIN_MINOR_VERSION)) {
                    glaDispose();
                    return GLA_ERROR_OPENGL_VERSION;
                } else {
#ifdef GLFW_SUPPORT_EXTENSIONS
                    detect_extensions();
#endif
#ifdef GLFW_SUPPORT_OPTIONAL_VERSIONS
                    detect_versions();
#endif
                    return GLA_OK;
                }
            }
        }
    }
}

int glaDispose()
{
    gla_major_version = 0;
    gla_minor_version = 0;
    gla_error = NULL;
    reset_functions();
#ifdef GLFW_SUPPORT_EXTENSIONS
    reset_extensions();
#endif
#ifdef GLFW_SUPPORT_OPTIONAL_VERSIONS
    reset_versions();
#endif
    gla_close_libgl();
    return NULL == gla_error ? GLA_OK : GLA_ERROR_LIBRARY_CLOSE;
}

const char* glaError()
{
    return gla_error;
}

const char* glaErrorCodeToMessage(const GLenum error_code)
{
    switch (error_code) {
    case GL_INVALID_ENUM:
        return "GL_INVALID_ENUM";
    case GL_INVALID_VALUE:
        return "GL_INVALID_VALUE";
    case GL_INVALID_OPERATION:
        return "GL_INVALID_OPERATION";
    case GL_STACK_OVERFLOW:
        return "GL_STACK_OVERFLOW";
    case GL_STACK_UNDERFLOW:
        return "GL_STACK_UNDERFLOW";
    case GL_OUT_OF_MEMORY:
        return "GL_OUT_OF_MEMORY";
    default:
        return NULL;
    }
}

#ifdef GLA_AUTO_CHECK_ERROR_HANDLER

void glaCheckError(const char* statement, const char* filename, const int line)
{
    const GLenum error_code = glGetError();
    if (GL_NO_ERROR != error_code) {
        const char* error_code_description = glaErrorCodeToMessage(error_code);
        if (NULL == error_code_description) {
            char buffer[10];
            snprintf(buffer, 10, "%08x", error_code);
            error_code_description = buffer;
        }

        snprintf(gla_error_buffer, GLA_MAX_ERROR_MESSAGE_LENGTH, "OpenGL error %s, at %s:%i - %s", error_code_description, filename, line, statement);
        gla_error = gla_error_buffer;
        GLA_AUTO_CHECK_ERROR_HANDLER(gla_error);
    }
}

#endif // GLA_AUTO_CHECK_ERRORS

#endif // GLA_IMPLEMENTATION

#ifdef __cplusplus
}
#endif

#endif
