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

#ifndef BRAINCHECK_H
#define BRAINCHECK_H

#ifdef __cplusplus
extern "C" {
#endif

// The developer should define "BRAINCHECK_PRINTF" to a function that prints *and* flushes output
// This is used when outputting debug information specific to the developer
#ifndef BRAINCHECK_PRINTF
#error "The developer should define BRAINCHECK_PRINTF prior to including braincheck header"
#endif

#include <stdbool.h>

#if defined(__clang__) || defined(__GNUC__)
#define BRAINCHECK_FUNCTION_NAME __PRETTY_FUNCTION__
#elif defined(_MSC_VER)
#define BRAINCHECK_FUNCTION_NAME __FUNCSIG__
#else
#define BRAINCHECK_FUNCTION_NAME __func__
#endif

#ifndef BRAINCHECK_NO_DEBUG

/**
 * Print value of expression where the expression is a non-array atomic value.
 */
#define braincheck_debug(expr)                      \
    _Generic((expr),                                \
             char                                   \
             : braincheck_debug_char,               \
               signed char                          \
             : braincheck_debug_signed_char,        \
               unsigned char                        \
             : braincheck_debug_unsigned_char,      \
               short                                \
             : braincheck_debug_short,              \
               unsigned short                       \
             : braincheck_debug_unsigned_short,     \
               int                                  \
             : braincheck_debug_int,                \
               unsigned int                         \
             : braincheck_debug_unsigned_int,       \
               long                                 \
             : braincheck_debug_long,               \
               unsigned long                        \
             : braincheck_debug_unsigned_long,      \
               long long                            \
             : braincheck_debug_long_long,          \
               unsigned long long                   \
             : braincheck_debug_unsigned_long_long, \
               float                                \
             : braincheck_debug_float,              \
               double                               \
             : braincheck_debug_double,             \
               bool                                 \
             : braincheck_debug_bool,               \
               default                              \
             : braincheck_debug_pointer)(__FILE__, __LINE__, BRAINCHECK_FUNCTION_NAME, #expr, expr)

#define braincheck_debug_array(expr, length)              \
    _Generic((expr),                                      \
             bool*                                        \
             : braincheck_debug_bool_array,               \
               const bool*                                \
             : braincheck_debug_bool_array,               \
               char*                                      \
             : braincheck_debug_char_array,               \
               const char*                                \
             : braincheck_debug_char_array,               \
               signed char*                               \
             : braincheck_debug_signed_char_array,        \
               const signed char*                         \
             : braincheck_debug_signed_char_array,        \
               unsigned char*                             \
             : braincheck_debug_unsigned_char_array,      \
               const unsigned char*                       \
             : braincheck_debug_unsigned_char_array,      \
               short*                                     \
             : braincheck_debug_short_array,              \
               const short*                               \
             : braincheck_debug_short_array,              \
               unsigned short*                            \
             : braincheck_debug_unsigned_short_array,     \
               const unsigned short*                      \
             : braincheck_debug_unsigned_short_array,     \
               int*                                       \
             : braincheck_debug_int_array,                \
               const int*                                 \
             : braincheck_debug_int_array,                \
               unsigned int*                              \
             : braincheck_debug_unsigned_int_array,       \
               const unsigned int*                        \
             : braincheck_debug_unsigned_int_array,       \
               long*                                      \
             : braincheck_debug_long_array,               \
               const long*                                \
             : braincheck_debug_long_array,               \
               unsigned long*                             \
             : braincheck_debug_unsigned_long_array,      \
               const unsigned long*                       \
             : braincheck_debug_unsigned_long_array,      \
               long long*                                 \
             : braincheck_debug_long_long_array,          \
               const long long*                           \
             : braincheck_debug_long_long_array,          \
               unsigned long long*                        \
             : braincheck_debug_unsigned_long_long_array, \
               const unsigned long long*                  \
             : braincheck_debug_unsigned_long_long_array, \
               float*                                     \
             : braincheck_debug_float_array,              \
               const float*                               \
             : braincheck_debug_float_array,              \
               double*                                    \
             : braincheck_debug_double_array,             \
               const double*                              \
             : braincheck_debug_double_array)(__FILE__, __LINE__, BRAINCHECK_FUNCTION_NAME, #expr, expr, length)

#define BRAINCHECK_INTERNAL_DEBUG_FUNC(name, type, formatter_specifier)                                                                                                              \
    static inline void braincheck_debug_##name(const char* file, const int line, const char* function, const char* expression, const type value)                                     \
    {                                                                                                                                                                                \
        BRAINCHECK_PRINTF("%s:%d: %s - '%s' = " formatter_specifier "\n", file, line, function, expression, value);                                                                  \
    }                                                                                                                                                                                \
    static inline void braincheck_debug_##name##_array(const char* file, const int line, const char* function, const char* expression, const type* value, const unsigned int length) \
    {                                                                                                                                                                                \
        BRAINCHECK_PRINTF("%s:%d: %s - '%s' = [", file, line, function, expression);                                                                                                 \
        for (int i = 0; i < length; i++) {                                                                                                                                           \
            if (0 != i) {                                                                                                                                                            \
                BRAINCHECK_PRINTF(", ");                                                                                                                                             \
            }                                                                                                                                                                        \
            BRAINCHECK_PRINTF(formatter_specifier, value[i]);                                                                                                                        \
        }                                                                                                                                                                            \
        BRAINCHECK_PRINTF("]\n");                                                                                                                                                    \
    }

BRAINCHECK_INTERNAL_DEBUG_FUNC(char, char, "%c");
BRAINCHECK_INTERNAL_DEBUG_FUNC(signed_char, signed char, "%c");
BRAINCHECK_INTERNAL_DEBUG_FUNC(unsigned_char, unsigned char, "%c");
BRAINCHECK_INTERNAL_DEBUG_FUNC(short, short, "%hd");
BRAINCHECK_INTERNAL_DEBUG_FUNC(unsigned_short, unsigned short, "%hu");
BRAINCHECK_INTERNAL_DEBUG_FUNC(int, int, "%d");
BRAINCHECK_INTERNAL_DEBUG_FUNC(unsigned_int, unsigned int, "%u");
BRAINCHECK_INTERNAL_DEBUG_FUNC(long, long, "%ld");
BRAINCHECK_INTERNAL_DEBUG_FUNC(unsigned_long, unsigned long, "%lu");
BRAINCHECK_INTERNAL_DEBUG_FUNC(long_long, long long, "%lld");
BRAINCHECK_INTERNAL_DEBUG_FUNC(unsigned_long_long, unsigned long long, "%llu");
BRAINCHECK_INTERNAL_DEBUG_FUNC(float, float, "%f");
BRAINCHECK_INTERNAL_DEBUG_FUNC(double, double, "%f");

static inline void braincheck_debug_bool(const char* file, const int line, const char* function, const char* expression, const bool value)
{
    BRAINCHECK_PRINTF("%s:%d: %s - '%s' = %s\n", file, line, function, expression, value ? "true" : "false");
}
static inline void braincheck_debug_bool_array(const char* file, const int line, const char* function, const char* expression, const bool* value, const unsigned int length)
{
    BRAINCHECK_PRINTF("%s:%d: %s - '%s' = [", file, line, function, expression);
    for (int i = 0; i < length; i++) {
        if (0 != i) {
            BRAINCHECK_PRINTF(", ");
        }
        BRAINCHECK_PRINTF("%s", value[i] ? "true" : "false");
    }
    BRAINCHECK_PRINTF("]\n");
}
static inline void braincheck_debug_pointer(const char* file, const int line, const char* function, const char* expression, const void* value)
{
    BRAINCHECK_PRINTF("%s:%d: %s - '%s' = %p\n", file, line, function, expression, value);
}

#undef BRAINCHECK_INTERNAL_DEBUG_FUNC

#endif

#ifndef BRAINCHECK_NO_BACKTRACE
#include <stdlib.h>
#include <execinfo.h>
#endif

#ifdef BRAINCHECK_NO_BACKTRACE
#define braincheck_backtrace_n(max_frame_count)
#define braincheck_backtrace()
#else

#ifndef BRAINCHECK_MAX_BACKTRACE_FRAMES
#define BRAINCHECK_MAX_BACKTRACE_FRAMES 128
#endif

/**
 * Print a backtrace with at most max_frame_count frames.
 */
#define braincheck_backtrace_n(max_frame_count)                                         \
    do {                                                                                \
        void* callstack[(max_frame_count) + 1];                                         \
                                                                                        \
        braincheck_internal_backtrace(__FILE__,                                         \
                                      __LINE__,                                         \
                                      BRAINCHECK_FUNCTION_NAME,                         \
                                      &callstack[0],                                    \
                                      backtrace(&callstack[0], (max_frame_count) + 1)); \
    } while (0)

/**
 * Print a backtrace with at most BRAINCHECK_MAX_BACKTRACE_FRAMES frames.
 */
#define braincheck_backtrace() braincheck_backtrace_n(BRAINCHECK_MAX_BACKTRACE_FRAMES)

static inline void braincheck_internal_backtrace(const char* file, int line, const char* function, void** callstack_buffer, const int max_callstack_depth)
{
    BRAINCHECK_PRINTF("%s:%d: %s\n", file, line, function);
    char** callstack = backtrace_symbols(callstack_buffer, max_callstack_depth);
    if (NULL != callstack) {
        // Starting at 1 skips the current frame which should be ok given the function parameter indicates frame
        for (int i = 1; i < max_callstack_depth; i++) {
            BRAINCHECK_PRINTF("  %s\n", callstack[i]);
        }

        free(callstack);
    }
}
#endif

#ifdef __cplusplus
}
#endif

#endif
