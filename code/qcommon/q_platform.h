/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/

#ifndef Q_PLATFORM_H
#define Q_PLATFORM_H

// this is for determining if we have an asm version of a C function
#define idx64 0

#ifdef __wasm32__
#define Q3_VM
#endif

#ifndef Q3_VM
#if (defined _M_IX86 || defined __i386__) && !defined(C_ONLY)
#error "32-bit platforms are not supported"
#endif
#endif

#ifndef __ASM_I386__ // don't include the C bits if included from qasm.h

// for windows fastcall option
#define QDECL
#define QCALL

//================================================================= WIN64/32 ===

#if defined(_WIN64) || defined(__WIN64__)

#undef idx64
#define idx64 1

#undef QDECL
#define QDECL __cdecl

#undef QCALL
#define QCALL __stdcall

#if defined(_MSC_VER)
#define OS_STRING "win_msvc64"
#elif defined __MINGW64__
#define OS_STRING "win_mingw64"
#endif

#define PATH_SEP '\\'

#if defined(__WIN64__)
#define ARCH_STRING "x86_64"
#elif defined _M_ALPHA
#define ARCH_STRING "AXP"
#endif

#define Q3_LITTLE_ENDIAN

#define DLL_EXT ".dll"

#endif

//============================================================== MAC OS X ===

#if defined(__APPLE__) || defined(__APPLE_CC__)

#define OS_STRING "macosx"
#define PATH_SEP '/'

#ifdef __ppc__
#define ARCH_STRING "ppc"
#define Q3_BIG_ENDIAN
#elif defined __i386__
#define ARCH_STRING "x86"
#define Q3_LITTLE_ENDIAN
#elif defined __x86_64__
#undef idx64
#define idx64 1
#define ARCH_STRING "x86_64"
#define Q3_LITTLE_ENDIAN
#elif defined __aarch64__
#define ARCH_STRING "arm64"
#define Q3_LITTLE_ENDIAN
#endif

#define DLL_EXT ".so"

#endif

//================================================================= LINUX ===

#if defined(__linux__) || defined(__GNU__)

#include <endian.h>

#if defined(__linux__)
#define OS_STRING "linux"
#else
#define OS_STRING "GNU"
#endif

#define PATH_SEP '/'

#if defined __x86_64__
#undef idx64
#define idx64 1
#elif defined __aarch64__
#define ARCH_STRING "arm64"
#define Q3_LITTLE_ENDIAN
#endif

#if !defined(ARCH_STRING)
#error ARCH_STRING should be defined by the Makefile
#endif

#if __FLOAT_WORD_ORDER == __BIG_ENDIAN && !defined(Q3_LITTLE_ENDIAN)
#define Q3_BIG_ENDIAN
#else
#define Q3_LITTLE_ENDIAN
#endif

#define DLL_EXT ".so"

#endif

//================================================================== Q3VM ===

#ifdef Q3_VM

#define OS_STRING "q3vm"
#define PATH_SEP '/'

#define ARCH_STRING "bytecode"

#define DLL_EXT ".wasm"

#endif

//===========================================================================

// catch missing defines in above blocks
#if !defined(OS_STRING)
#error "Operating system not supported"
#endif

#if !defined(ARCH_STRING)
#error "Architecture not supported"
#endif

#ifndef PATH_SEP
#error "PATH_SEP not defined"
#endif

#ifndef DLL_EXT
#error "DLL_EXT not defined"
#endif

// endianness
short ShortSwap(short l);
int LongSwap(int l);
float FloatSwap(const float* f);

static FORCEINLINE short LittleShort(const short value)
{
#if defined(Q3_BIG_ENDIAN)
    return ShortSwap(value);
#elif defined(Q3_LITTLE_ENDIAN) || defined(Q3_VM)
    return value;
#endif
}

static FORCEINLINE int LittleLong(const int value)
{
#if defined(Q3_BIG_ENDIAN)
    return LongSwap(value);
#elif defined(Q3_LITTLE_ENDIAN) || defined(Q3_VM)
    return value;
#endif
}

static FORCEINLINE float LittleFloat(const float value)
{
#if defined(Q3_BIG_ENDIAN)
    return FloatSwap(&value);
#elif defined(Q3_LITTLE_ENDIAN) || defined(Q3_VM)
    return value;
#endif
}

static FORCEINLINE short BigShort(const short value)
{
#if defined(Q3_BIG_ENDIAN) || defined(Q3_VM)
    return value;
#elif defined(Q3_LITTLE_ENDIAN)
    return ShortSwap(value);
#endif
}

#if defined(Q3_BIG_ENDIAN) && defined(Q3_LITTLE_ENDIAN)
#error "Endianness defined as both big and little"
#elif !defined(Q3_BIG_ENDIAN) && !defined(Q3_LITTLE_ENDIAN) && !defined(Q3_VM)
#error "Endianness not defined"
#endif

// platform string
#ifdef NDEBUG
#define PLATFORM_STRING OS_STRING "-" ARCH_STRING
#else
#define PLATFORM_STRING OS_STRING "-" ARCH_STRING "-debug"
#endif

#endif

#endif
