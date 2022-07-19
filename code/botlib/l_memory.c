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

/*****************************************************************************
 * memory allocation
 *****************************************************************************/

#include "../qcommon/q_shared.h"
#include "botlib.h"
#include "l_log.h"
#include "l_memory.h"
#include "be_interface.h"

#define MEM_ID 0x12345678l
#define HUNK_ID 0x87654321l

void* GetMemory(size_t size)
{
    void* ptr;
    unsigned long int* memid;

    ptr = botimport.GetMemory(size + sizeof(unsigned long int));
    if (!ptr)
        return NULL;
    memid = (unsigned long int*)ptr;
    *memid = MEM_ID;
    return (unsigned long int*)((char*)ptr + sizeof(unsigned long int));
}
void* GetClearedMemory(size_t size)
{
    void* ptr;
    ptr = GetMemory(size);
    memset(ptr, 0, size);
    return ptr;
}
void* GetHunkMemory(unsigned long size)
{
    void* ptr;
    unsigned long int* memid;

    ptr = botimport.HunkAlloc(size + sizeof(unsigned long int));
    if (!ptr)
        return NULL;
    memid = (unsigned long int*)ptr;
    *memid = HUNK_ID;
    return (unsigned long int*)((char*)ptr + sizeof(unsigned long int));
}
void* GetClearedHunkMemory(unsigned long size)
{
    void* ptr;
    ptr = GetHunkMemory(size);
    memset(ptr, 0, size);
    return ptr;
}
void FreeMemory(void* ptr)
{
    unsigned long int* memid;

    memid = (unsigned long int*)((char*)ptr - sizeof(unsigned long int));

    if (*memid == MEM_ID) {
        botimport.FreeMemory(memid);
    }
}
int AvailableMemory()
{
    return botimport.AvailableMemory();
}
