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
#ifndef CVAR_ENGINE_H
#define CVAR_ENGINE_H

#include "cvar_common.h"

// nothing outside the Cvar_*() functions should modify these fields!
typedef struct cvar_s cvar_t;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpadded"
struct cvar_s {
    char* name;
    char* description;
    char* string;
    char* resetString; // cvar_restart will reset to this value
    char* latchedString; // for CVAR_LATCH vars
    cvar_t* next;
    cvar_t* prev;
    cvar_t* hashNext;
    cvar_t* hashPrev;
    int flags;
    int modificationCount; // incremented each time the cvar is changed
    float value; // atof( string )
    int integer; // atoi( string )
    float min;
    float max;

    int hashIndex;
    bool modified; // set each time the cvar is changed
    bool validate;
    bool integral;
};
#pragma clang diagnostic pop

cvar_t* Cvar_Get(const char* var_name, const char* value, int flags);
// creates the variable if it doesn't exist, or returns the existing one
// if it exists, the value will not be changed, but flags will be ORed in
// that allows variables to be unarchived without needing bitflags
// if value is "", the value will not override a previously set value.

void Cvar_Register(vmCvar_t* vmCvar, const char* varName, const char* defaultValue, int flags);
// basically a slightly modified Cvar_Get for the interpreted modules

void Cvar_Update(vmCvar_t* vmCvar);
// updates an interpreted modules' version of a cvar

void Cvar_Set(const char* var_name, const char* value);
// will create the variable with no flags if it doesn't exist

cvar_t* Cvar_Set2(const char* var_name, const char* value, bool force);
// same as Cvar_Set, but allows more control over setting of cvar

void Cvar_SetSafe(const char* var_name, const char* value);
// sometimes we set variables from an untrusted source: fail if flags & CVAR_PROTECTED

void Cvar_SetLatched(const char* var_name, const char* value);
// don't set the cvar immediately

void Cvar_SetValue(const char* var_name, float value);
void Cvar_SetValueSafe(const char* var_name, float value);
// expands value to a string and calls Cvar_Set/Cvar_SetSafe

float Cvar_VariableValue(const char* var_name);
int Cvar_VariableIntegerValue(const char* var_name);
// returns 0 if not defined or non numeric

char* Cvar_VariableString(const char* var_name);
void Cvar_VariableStringBuffer(const char* var_name, char* buffer, int bufsize);
// returns an empty string if not defined

int Cvar_Flags(const char* var_name);
// returns CVAR_NONEXISTENT if cvar doesn't exist or the flags of that particular CVAR.

void Cvar_CommandCompletion(void (*callback)(const char* s));
// callback with each valid string

void Cvar_Reset(const char* var_name);
void Cvar_ForceReset(const char* var_name);

void Cvar_SetCheatState(void);
// reset all testing vars to a safe value

bool Cvar_Command(void);
// called by Cmd_ExecuteString when Cmd_Argv(0) doesn't match a known
// command.  Returns true if the command was a variable reference that
// was handled. (print or change)

void Cvar_WriteVariables(fileHandle_t f);
// writes lines containing "set variable value" for all variables
// with the archive flag set to true.

void Cvar_Init(void);

char* Cvar_InfoString(int bit);
char* Cvar_InfoString_Big(int bit);
// returns an info string containing all the cvars that have the given bit set
// in their flags ( CVAR_USERINFO, CVAR_SERVERINFO, CVAR_SYSTEMINFO, etc )
void Cvar_InfoStringBuffer(int bit, char* buff, int buffsize);
void Cvar_CheckRange(cvar_t* cv, float minVal, float maxVal, bool shouldBeIntegral);
void Cvar_SetDescription(cvar_t* var, const char* var_description);

void Cvar_Restart(bool unsetVM);
void Cvar_Restart_f(void);

void Cvar_CompleteCvarName(char* args, int argNum);

extern int cvar_modifiedFlags;
// whenever a cvar is modifed, its flags will be OR'd into this, so
// a single check can determine if any CVAR_USERINFO, CVAR_SERVERINFO,
// etc, variables have been modified since the last check.  The bit
// can then be cleared to allow another change detection.

#endif
