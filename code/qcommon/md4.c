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
#include "qcommon.h"
#include "md4.h"

uint32_t Com_BlockChecksum(const void* buffer, const size_t length)
{
    MD4_CTX ctx;

    MD4_Init(&ctx);
    MD4_Update(&ctx, (const unsigned char*)buffer, length);

    uint32_t digest[4];
    MD4_Final((unsigned char*)digest, &ctx);

    return digest[0] ^ digest[1] ^ digest[2] ^ digest[3];
}
