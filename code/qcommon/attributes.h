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

#ifndef ATTRIBUTES_H
#define ATTRIBUTES_H

// The symbol marked by this attribute may be unused
#ifndef UNUSED
#if defined(__GNUC__)
#define UNUSED __attribute__((unused))
#else
#define UNUSED
#endif
#endif

// The function marked by this attribute is exported from a shared library
#ifndef EXPORT
#if defined(_MSC_VER)
#define EXPORT UNUSED __declspec(dllexport)
#elif defined(__GNUC__)
#define EXPORT UNUSED __attribute__((visibility("default")))
#else
#define EXPORT UNUSED
#endif
#endif

// The function marked this attribute never returns
#ifndef NORETURN
#if defined(__GNUC__)
#define NORETURN __attribute__((noreturn))
#elif defined(_MSC_VER)
#define NORETURN __declspec(noreturn)
#else
#define NORETURN
#endif
#endif

// The function marked by this attribute has a formatting string similar to printf and a variable number of data arguments
#if defined(__clang__) || defined(__GNUC__)
#define PRINTF_FUNCTION(format_position, varargs_start_position) __attribute__((format(printf, format_position, varargs_start_position)))
#else
#define PRINTF_FUNCTION(format_position, varargs_start_position)
#endif

#endif
