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
#define PRINTF_LIKE_FUNCTION(format_position, varargs_start_position) __attribute__((format(printf, format_position, varargs_start_position))) NONNULL_ARGS(format_position)
#else
#define PRINTF_LIKE_FUNCTION(format_position, varargs_start_position)
#endif

// The compiler should predict that the expression is true. Used when predicting branches.
#if defined(__clang__) || defined(__GNUC__)
#define LIKELY(expr) __builtin_expect(!!(expr), 1)
#else
#define LIKELY(expr) (!!(expr))
#endif

// The compiler should predict that the expression is true. Used when predicting branches.
#if defined(__clang__) || defined(__GNUC__)
#define UNLIKELY(expr) __builtin_expect(!!(expr), 0)
#else
#define UNLIKELY(expr) (!!(expr))
#endif

// The user should check the return value of the function marked by this attribute
#if defined(__clang__) || defined(__GNUC__)
#define CHECK_RETURN_VALUE __attribute__((warn_unused_result))
#else
#define CHECK_RETURN_VALUE
#endif

// The function marked by this attribute has observable effects on the state of the program other than to return a value.
#if defined(__clang__) || defined(__GNUC__)
#define PURE __attribute__((pure))
#else
#define PURE
#endif

// The function marked by this attribute returns a non-null pointer.
#if defined(__clang__) || defined(__GNUC__)
#define RETURNS_NONNULL __attribute__((returns_nonnull))
#else
#define RETURNS_NONNULL
#endif

// The function marked by this attribute has nonnull pointer arguments as specified by comma separate arg indexes args
#if defined(__clang__) || defined(__GNUC__)
#define NONNULL_ARGS(args) __attribute__((nonnull(args)))
#else
#define NONNULL_ARGS(args)
#endif

// The element marked by this attribute is deprecated and should not be used
#if defined(__clang__) || defined(__GNUC__)
#define DEPRECATED __attribute__((deprecated))
#else
#define DEPRECATED
#endif

#endif
