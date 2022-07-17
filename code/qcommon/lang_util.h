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

#ifndef LANG_UTIL_H
#define LANG_UTIL_H

#pragma clang diagnostic ignored "-Wunknown-pragmas"

// Disable warning in CLion that usage of COUNT_OF would cause due to "0 [x]" syntax
// This syntax is used as because it will produce a compile error if COUNT_OF() is passed a pointer
#pragma ide diagnostic ignored "readability-misplaced-array-index"

/**
 * A macro that returns the number of elements in a statically allocated array.
 */
#define COUNT_OF(x) ((sizeof(x) / sizeof(0 [x])) / ((size_t)(!(sizeof(x) % sizeof(0 [x])))))

#endif
