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

#include "attributes.h"

/*****************************************************************************
 * botlib vars
 *****************************************************************************/

// library variable
typedef struct libvar_s {
    char* name;
    char* string;
    int flags;
    bool modified; // set each time the cvar is changed
    float value;
    struct libvar_s* next;
} libvar_t;

// removes all library variables
void LibVarDeAllocAll(void);
// gets the library variable with the given name
libvar_t* LibVarGet(const char* var_name);
// gets the string of the library variable with the given name
char* LibVarGetString(const char* var_name);
// gets the value of the library variable with the given name
float LibVarGetValue(const char* var_name);
// gets the value of the library variable with the given name
static FORCEINLINE int LibVarGetIntValue(const char* var_name)
{
    return (int)(LibVarGetValue(var_name));
}
// gets the value of the library variable with the given name
static FORCEINLINE bool LibVarGetBoolValue(const char* var_name)
{
    return 0 != LibVarGetIntValue(var_name) ? true : false;
}
// creates the library variable if not existing already and returns it
libvar_t* LibVar(const char* var_name, const char* value);
// creates the library variable if not existing already and returns the value
float LibVarValue(const char* var_name, const char* value);
// creates the library variable if not existing already and returns the value
static FORCEINLINE int LibVarIntValue(const char* var_name, const char* value)
{
    return (int)(LibVarValue(var_name, value));
}
// creates the library variable if not existing already and returns the value
static FORCEINLINE bool LibVarBoolValue(const char* var_name, const char* value)
{
    return 0 != LibVarIntValue(var_name, value) ? true : false;
}
// creates the library variable if not existing already and returns the value string
char* LibVarString(const char* var_name, const char* value);
// sets the library variable
void LibVarSet(const char* var_name, const char* value);
