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
#ifndef _WIN32
#error You should not be including this file on this platform
#endif

#ifndef GLW_WIN_H
#define GLW_WIN_H

typedef struct
{
    WNDPROC wndproc;

    HDC hDC; // handle to device context
    HGLRC hGLRC; // handle to GL rendering context

    HINSTANCE hinstOpenGL; // HINSTANCE for the OpenGL library

    bool allowdisplaydepthchange;
    bool pixelFormatSet;

    int desktopBitsPixel;
    int desktopWidth, desktopHeight;

    bool cdsFullscreen;
} glwstate_t;

extern glwstate_t glw_state;

#endif
