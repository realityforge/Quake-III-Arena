/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
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
GLA_API void glaCheckError(const char* statement, const char* filename, int line, void (*print)(const char*));

#define GLA_CHECK(statement)                                                         \
    do {                                                                             \
        statement;                                                                   \
        glaCheckError(#statement, __FILE__, __LINE__, GLA_AUTO_CHECK_ERROR_HANDLER); \
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

#ifdef __cplusplus
}
#endif

#endif
