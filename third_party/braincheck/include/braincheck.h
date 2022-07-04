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

#define braincheck_backtrace_n(max_frame_count)                                         \
    do {                                                                                \
        void* callstack[(max_frame_count) + 1];                                         \
                                                                                        \
        braincheck_internal_backtrace(__FILE__,                                         \
                                      __LINE__,                                         \
                                      __func__,                                         \
                                      &callstack[0],                                    \
                                      backtrace(&callstack[0], (max_frame_count) + 1)); \
    } while (0)

#define braincheck_backtrace() braincheck_backtrace_n(BRAINCHECK_MAX_BACKTRACE_FRAMES - 1)

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
