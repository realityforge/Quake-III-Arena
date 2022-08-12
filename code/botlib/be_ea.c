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
 * elementary actions
 *****************************************************************************/

#include "../qcommon/q_shared.h"
#include "l_memory.h"
#include "l_script.h"
#include "l_precomp.h"
#include "l_struct.h"
#include "botlib.h"
#include "be_interface.h"
#include "be_ea.h"

#define MAX_USERMOVE 400

static bot_input_t* botinputs;

void EA_Say(const int client, char* str)
{
    botimport.BotClientCommand(client, va("say %s", str));
}
void EA_SayTeam(const int client, char* str)
{
    botimport.BotClientCommand(client, va("say_team %s", str));
}
void EA_Gesture(const int client)
{
    botinputs[client].actionflags |= ACTION_GESTURE;
}
void EA_Command(const int client, char* command)
{
    botimport.BotClientCommand(client, command);
}
void EA_SelectWeapon(const int client, const int weapon)
{
    botinputs[client].weapon = weapon;
}
void EA_Attack(const int client)
{
    botinputs[client].actionflags |= ACTION_ATTACK;
}
void EA_Talk(const int client)
{
    botinputs[client].actionflags |= ACTION_TALK;
}
void EA_Use(const int client)
{
    botinputs[client].actionflags |= ACTION_USE;
}
void EA_Respawn(const int client)
{
    botinputs[client].actionflags |= ACTION_RESPAWN;
}
void EA_Jump(const int client)
{
    if (botinputs[client].actionflags & ACTION_JUMPEDLASTFRAME) {
        botinputs[client].actionflags &= ~ACTION_JUMP;
    } else {
        botinputs[client].actionflags |= ACTION_JUMP;
    }
}
void EA_DelayedJump(const int client)
{
    if (botinputs[client].actionflags & ACTION_JUMPEDLASTFRAME) {
        botinputs[client].actionflags &= ~ACTION_DELAYEDJUMP;
    } else {
        botinputs[client].actionflags |= ACTION_DELAYEDJUMP;
    }
}
void EA_Crouch(const int client)
{
    botinputs[client].actionflags |= ACTION_CROUCH;
}
void EA_Walk(const int client)
{
    botinputs[client].actionflags |= ACTION_WALK;
}
void EA_Action(int client, int action)
{
    botinputs[client].actionflags |= action;
}
void EA_MoveUp(const int client)
{
    botinputs[client].actionflags |= ACTION_MOVEUP;
}
void EA_MoveDown(const int client)
{
    botinputs[client].actionflags |= ACTION_MOVEDOWN;
}
void EA_MoveForward(const int client)
{
    botinputs[client].actionflags |= ACTION_MOVEFORWARD;
}
void EA_MoveBack(const int client)
{
    botinputs[client].actionflags |= ACTION_MOVEBACK;
}
void EA_MoveLeft(const int client)
{
    botinputs[client].actionflags |= ACTION_MOVELEFT;
}
void EA_MoveRight(const int client)
{
    botinputs[client].actionflags |= ACTION_MOVERIGHT;
}
void EA_Move(const int client, const vec3_t dir, const float speed)
{
    VectorCopy(dir, botinputs[client].dir);
    // cap speed
    botinputs[client].speed = speed > MAX_USERMOVE ? MAX_USERMOVE : speed < -MAX_USERMOVE ? -MAX_USERMOVE
                                                                                          : speed;
}
void EA_View(const int client, const vec3_t viewangles)
{
    VectorCopy(viewangles, botinputs[client].viewangles);
}
void EA_GetInput(const int client, const float thinktime, bot_input_t* input)
{
    botinputs[client].thinktime = thinktime;
    memcpy(input, &botinputs[client], sizeof(bot_input_t));
}
void EA_ResetInput(const int client)
{
    botinputs[client].thinktime = 0;
    VectorClear(botinputs[client].dir);
    botinputs[client].speed = 0;
    const bool jumped = botinputs[client].actionflags & ACTION_JUMP ? true : false;
    botinputs[client].actionflags = jumped ? ACTION_JUMPEDLASTFRAME : 0;
}
int EA_Setup()
{
    // initialize the bot inputs
    botinputs = (bot_input_t*)GetClearedHunkMemory(
        botlibglobals.maxclients * sizeof(bot_input_t));
    return BLERR_NOERROR;
}
void EA_Shutdown()
{
    FreeMemory(botinputs);
    botinputs = NULL;
}
