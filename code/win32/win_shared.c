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

#include "../qcommon/q_shared.h"
#include "../qcommon/qcommon.h"
#include "win_local.h"
#include <lmerr.h>
#include <lmcons.h>
#include <lmwksta.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <direct.h>
#include <io.h>
#include <conio.h>

int sys_timeBase;
int Sys_Milliseconds(void)
{
    int sys_curtime;
    static bool initialized = false;

    if (!initialized) {
        sys_timeBase = timeGetTime();
        initialized = true;
    }
    sys_curtime = timeGetTime() - sys_timeBase;

    return sys_curtime;
}

long fastftol(float f)
{
    static int tmp;
    __asm fld f __asm fistp tmp __asm mov eax, tmp
}

void Sys_SnapVector(float* v)
{
    int i;
    float f;

    f = *v;
    __asm fld f;
    __asm fistp i;
    *v = i;
    v++;
    f = *v;
    __asm fld f;
    __asm fistp i;
    *v = i;
    v++;
    f = *v;
    __asm fld f;
    __asm fistp i;
    *v = i;
    /*
    *v = fastftol(*v);
    v++;
    *v = fastftol(*v);
    v++;
    *v = fastftol(*v);
    */
}

/*
**
** Disable all optimizations temporarily so this code works correctly!
**
*/
#pragma optimize("", off)

static int IsPentium(void)
{
    __asm {
		pushfd // save eflags
		pop		eax
		test	eax, 0x00200000 // check ID bit
		jz		set21 // bit 21 is not set, so jump to set_21
		and		eax, 0xffdfffff // clear bit 21
		push	eax // save new value in register
		popfd // store new value in flags
		pushfd
		pop		eax
		test	eax, 0x00200000 // check ID bit
		jz		good
		jmp		err // cpuid not supported
set21:
		or		eax, 0x00200000 // set ID bit
		push	eax // store new value
		popfd // store new value in EFLAGS
		pushfd
		pop		eax
		test	eax, 0x00200000 // if bit 21 is on
		jnz		good
		jmp		err
    }

err:
    return false;
good:
    return true;
}

static int Is3DNOW(void)
{
    unsigned regs[4];
    char pstring[16];
    char processorString[13];

    // get name of processor
    CPUID(0, (unsigned int*)pstring);
    processorString[0] = pstring[4];
    processorString[1] = pstring[5];
    processorString[2] = pstring[6];
    processorString[3] = pstring[7];
    processorString[4] = pstring[12];
    processorString[5] = pstring[13];
    processorString[6] = pstring[14];
    processorString[7] = pstring[15];
    processorString[8] = pstring[8];
    processorString[9] = pstring[9];
    processorString[10] = pstring[10];
    processorString[11] = pstring[11];
    processorString[12] = 0;

    //  REMOVED because you can have 3DNow! on non-AMD systems
    //	if ( strcmp( processorString, "AuthenticAMD" ) )
    //		return false;

    // check AMD-specific functions
    CPUID(0x80000000, regs);
    if (regs[0] < 0x80000000)
        return false;

    // bit 31 of EDX denotes 3DNOW! support
    CPUID(0x80000001, regs);
    if (regs[3] & (1 << 31))
        return true;

    return false;
}

static int IsKNI(void)
{
    unsigned regs[4];

    // get CPU feature bits
    CPUID(1, regs);

    // bit 25 of EDX denotes KNI existence
    if (regs[3] & (1 << 25))
        return true;

    return false;
}

static int IsMMX(void)
{
    unsigned regs[4];

    // get CPU feature bits
    CPUID(1, regs);

    // bit 23 of EDX denotes MMX existence
    if (regs[3] & (1 << 23))
        return true;
    return false;
}

int Sys_GetProcessorId(void)
{
#if defined _M_ALPHA
    return CPUID_AXP;
#elif !defined _M_IX86
    return CPUID_GENERIC;
#else

    // verify we're at least a Pentium or 486 w/ CPUID support
    if (!IsPentium())
        return CPUID_INTEL_UNSUPPORTED;

    // check for MMX
    if (!IsMMX()) {
        // Pentium or PPro
        return CPUID_INTEL_PENTIUM;
    }

    // see if we're an AMD 3DNOW! processor
    if (Is3DNOW()) {
        return CPUID_AMD_3DNOW;
    }

    // see if we're an Intel Katmai
    if (IsKNI()) {
        return CPUID_INTEL_KATMAI;
    }

    // by default we're functionally a vanilla Pentium/MMX or P2/MMX
    return CPUID_INTEL_MMX;

#endif
}

/*
**
** Re-enable optimizations back to what they were
**
*/
#pragma optimize("", on)

char* Sys_DefaultHomePath(void)
{
    return NULL;
}

char* Sys_DefaultInstallPath(void)
{
    return Sys_Cwd();
}
