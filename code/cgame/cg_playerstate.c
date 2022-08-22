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
// cg_playerstate.c -- this file acts on changes in a new playerState_t
// With normal play, this will be done after local prediction, but when
// following another player or playing back a demo, it will be checked
// when the snapshot transitions like all the other entities

#include "cg_local.h"

/*
==============
CG_CheckAmmo

If the ammo has gone low enough to generate the warning, play a sound
==============
*/
static void CG_CheckAmmo()
{
    int i;
    int total;
    int previous;
    int weapons;

    // see about how many seconds of ammo we have remaining
    weapons = cg.snap->ps.stats[STAT_WEAPONS];
    total = 0;
    for (i = WP_MACHINEGUN; i < WP_NUM_WEAPONS; i++) {
        if (!(weapons & (1 << i))) {
            continue;
        }
        switch (i) {
        case WP_ROCKET_LAUNCHER:
        case WP_GRENADE_LAUNCHER:
        case WP_RAILGUN:
        case WP_SHOTGUN:
#ifdef TEAMARENA
        case WP_PROX_LAUNCHER:
#endif
            total += cg.snap->ps.ammo[i] * 1000;
            break;
        default:
            total += cg.snap->ps.ammo[i] * 200;
            break;
        }
        if (total >= 5000) {
            cg.lowAmmoWarning = 0;
            return;
        }
    }

    previous = cg.lowAmmoWarning;

    if (total == 0) {
        cg.lowAmmoWarning = 2;
    } else {
        cg.lowAmmoWarning = 1;
    }

    // play a sound on transitions
    if (cg.lowAmmoWarning != previous) {
        trap_S_StartLocalSound(cgs.media.noAmmoSound, CHAN_LOCAL_SOUND);
    }
}

static void CG_DamageFeedback(int yawByte, int pitchByte, int damage)
{
    float left, front, up;
    float kick;
    int health;
    float scale;
    vec3_t dir;
    vec3_t angles;
    float dist;
    float yaw, pitch;

    // show the attacking player's head and name in corner
    cg.attackerTime = cg.time;

    // the lower on health you are, the greater the view kick will be
    health = cg.snap->ps.stats[STAT_HEALTH];
    if (health < 40) {
        scale = 1;
    } else {
        scale = 40.0 / health;
    }
    kick = damage * scale;

    if (kick < 5)
        kick = 5;
    if (kick > 10)
        kick = 10;

    // if yaw and pitch are both 255, make the damage always centered (falling, etc)
    if (yawByte == 255 && pitchByte == 255) {
        cg.damageX = 0;
        cg.damageY = 0;
        cg.v_dmg_roll = 0;
        cg.v_dmg_pitch = -kick;
    } else {
        // positional
        pitch = pitchByte / 255.0 * 360;
        yaw = yawByte / 255.0 * 360;

        angles[PITCH] = pitch;
        angles[YAW] = yaw;
        angles[ROLL] = 0;

        AngleVectors(angles, dir, NULL, NULL);
        VectorSubtract(vec3_origin, dir, dir);

        front = DotProduct(dir, cg.refdef.viewaxis[0]);
        left = DotProduct(dir, cg.refdef.viewaxis[1]);
        up = DotProduct(dir, cg.refdef.viewaxis[2]);

        dir[0] = front;
        dir[1] = left;
        dir[2] = 0;
        dist = VectorLength(dir);
        if (dist < 0.1) {
            dist = 0.1f;
        }

        cg.v_dmg_roll = kick * left;

        cg.v_dmg_pitch = -kick * front;

        if (front <= 0.1) {
            front = 0.1f;
        }
        cg.damageX = -left / front;
        cg.damageY = up / dist;
    }

    // clamp the position
    if (cg.damageX > 1.0) {
        cg.damageX = 1.0;
    }
    if (cg.damageX < -1.0) {
        cg.damageX = -1.0;
    }

    if (cg.damageY > 1.0) {
        cg.damageY = 1.0;
    }
    if (cg.damageY < -1.0) {
        cg.damageY = -1.0;
    }

    // don't let the screen flashes vary as much
    if (kick > 10) {
        kick = 10;
    }
    cg.damageValue = kick;
    cg.v_dmg_time = cg.time + DAMAGE_TIME;
    cg.damageTime = cg.snap->serverTime;
}

/*
================
CG_Respawn

A respawn happened this snapshot
================
*/
void CG_Respawn()
{
    // no error decay on player movement
    cg.thisFrameTeleport = true;

    // display weapons available
    cg.weaponSelectTime = cg.time;

    // select the weapon the server says we are using
    cg.weaponSelect = cg.snap->ps.weapon;
}

extern char* eventnames[];

static void CG_CheckPlayerstateEvents(playerState_t* ps, playerState_t* ops)
{
    int i;
    int event;
    centity_t* cent;

    if (ps->externalEvent && ps->externalEvent != ops->externalEvent) {
        cent = &cg_entities[ps->clientNum];
        cent->currentState.event = ps->externalEvent;
        cent->currentState.eventParm = ps->externalEventParm;
        CG_EntityEvent(cent, cent->lerpOrigin);
    }

    cent = &cg.predictedPlayerEntity; // cg_entities[ ps->clientNum ];
    // go through the predictable events buffer
    for (i = ps->eventSequence - MAX_PS_EVENTS; i < ps->eventSequence; i++) {
        // if we have a new predictable event
        if (i >= ops->eventSequence
            // or the server told us to play another event instead of a predicted event we already issued
            // or something the server told us changed our prediction causing a different event
            || (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS - 1)] != ops->events[i & (MAX_PS_EVENTS - 1)])) {

            event = ps->events[i & (MAX_PS_EVENTS - 1)];
            cent->currentState.event = event;
            cent->currentState.eventParm = ps->eventParms[i & (MAX_PS_EVENTS - 1)];
            CG_EntityEvent(cent, cent->lerpOrigin);

            cg.predictableEvents[i & (MAX_PREDICTED_EVENTS - 1)] = event;

            cg.eventSequence++;
        }
    }
}

static void pushReward(sfxHandle_t sfx, qhandle_t shader, int rewardCount)
{
    if (cg.rewardStack < (MAX_REWARDSTACK - 1)) {
        cg.rewardStack++;
        cg.rewardSound[cg.rewardStack] = sfx;
        cg.rewardShader[cg.rewardStack] = shader;
        cg.rewardCount[cg.rewardStack] = rewardCount;
    }
}

static void CG_CheckLocalSounds(playerState_t* ps, playerState_t* ops)
{
    int highScore, reward;
    sfxHandle_t sfx;
#ifdef TEAMARENA
    int health;
    int armor;
#endif

    // don't play the sounds if the player just changed teams
    if (ps->persistent[PERS_TEAM] != ops->persistent[PERS_TEAM]) {
        return;
    }

    // hit changes
    if (ps->persistent[PERS_HITS] > ops->persistent[PERS_HITS]) {
#ifdef TEAMARENA
        armor = ps->persistent[PERS_ATTACKEE_ARMOR] & 0xff;
        health = ps->persistent[PERS_ATTACKEE_ARMOR] >> 8;
        if (armor > 50) {
            trap_S_StartLocalSound(cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND);
        } else if (armor || health > 100) {
            trap_S_StartLocalSound(cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND);
        } else {
            trap_S_StartLocalSound(cgs.media.hitSound, CHAN_LOCAL_SOUND);
        }
#else
        trap_S_StartLocalSound(cgs.media.hitSound, CHAN_LOCAL_SOUND);
#endif
    } else if (ps->persistent[PERS_HITS] < ops->persistent[PERS_HITS]) {
        trap_S_StartLocalSound(cgs.media.hitTeamSound, CHAN_LOCAL_SOUND);
    }

    // health changes of more than -1 should make pain sounds
    if (ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1) {
        if (ps->stats[STAT_HEALTH] > 0) {
            CG_PainEvent(&cg.predictedPlayerEntity, ps->stats[STAT_HEALTH]);
        }
    }

    // if we are going into the intermission, don't start any voices
    if (cg.intermissionStarted) {
        return;
    }

    // reward sounds
    reward = false;
    if (ps->persistent[PERS_CAPTURES] != ops->persistent[PERS_CAPTURES]) {
        pushReward(cgs.media.captureAwardSound, cgs.media.medalCapture, ps->persistent[PERS_CAPTURES]);
        reward = true;
    }
    if (ps->persistent[PERS_IMPRESSIVE_COUNT] != ops->persistent[PERS_IMPRESSIVE_COUNT]) {
#ifdef TEAMARENA
        if (ps->persistent[PERS_IMPRESSIVE_COUNT] == 1) {
            sfx = cgs.media.firstImpressiveSound;
        } else {
            sfx = cgs.media.impressiveSound;
        }
#else
        sfx = cgs.media.impressiveSound;
#endif
        pushReward(sfx, cgs.media.medalImpressive, ps->persistent[PERS_IMPRESSIVE_COUNT]);
        reward = true;
    }
    if (ps->persistent[PERS_EXCELLENT_COUNT] != ops->persistent[PERS_EXCELLENT_COUNT]) {
#ifdef TEAMARENA
        if (ps->persistent[PERS_EXCELLENT_COUNT] == 1) {
            sfx = cgs.media.firstExcellentSound;
        } else {
            sfx = cgs.media.excellentSound;
        }
#else
        sfx = cgs.media.excellentSound;
#endif
        pushReward(sfx, cgs.media.medalExcellent, ps->persistent[PERS_EXCELLENT_COUNT]);
        reward = true;
    }
    if (ps->persistent[PERS_GAUNTLET_FRAG_COUNT] != ops->persistent[PERS_GAUNTLET_FRAG_COUNT]) {
#ifdef TEAMARENA
        if (ops->persistent[PERS_GAUNTLET_FRAG_COUNT] == 1) {
            sfx = cgs.media.firstHumiliationSound;
        } else {
            sfx = cgs.media.humiliationSound;
        }
#else
        sfx = cgs.media.humiliationSound;
#endif
        pushReward(sfx, cgs.media.medalGauntlet, ps->persistent[PERS_GAUNTLET_FRAG_COUNT]);
        reward = true;
    }
    if (ps->persistent[PERS_DEFEND_COUNT] != ops->persistent[PERS_DEFEND_COUNT]) {
        pushReward(cgs.media.defendSound, cgs.media.medalDefend, ps->persistent[PERS_DEFEND_COUNT]);
        reward = true;
    }
    if (ps->persistent[PERS_ASSIST_COUNT] != ops->persistent[PERS_ASSIST_COUNT]) {
        pushReward(cgs.media.assistSound, cgs.media.medalAssist, ps->persistent[PERS_ASSIST_COUNT]);
        reward = true;
    }
    // if any of the player event bits changed
    if (ps->persistent[PERS_PLAYEREVENTS] != ops->persistent[PERS_PLAYEREVENTS]) {
        if ((ps->persistent[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD) != (ops->persistent[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD)) {
            trap_S_StartLocalSound(cgs.media.deniedSound, CHAN_ANNOUNCER);
        } else if ((ps->persistent[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD) != (ops->persistent[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD)) {
            trap_S_StartLocalSound(cgs.media.humiliationSound, CHAN_ANNOUNCER);
        } else if ((ps->persistent[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT) != (ops->persistent[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT)) {
            trap_S_StartLocalSound(cgs.media.holyShitSound, CHAN_ANNOUNCER);
        }
        reward = true;
    }

    // check for flag pickup
    if (cgs.gametype >= GT_TEAM) {
        if ((ps->powerups[PW_REDFLAG] != ops->powerups[PW_REDFLAG] && ps->powerups[PW_REDFLAG]) || (ps->powerups[PW_BLUEFLAG] != ops->powerups[PW_BLUEFLAG] && ps->powerups[PW_BLUEFLAG]) || (ps->powerups[PW_NEUTRALFLAG] != ops->powerups[PW_NEUTRALFLAG] && ps->powerups[PW_NEUTRALFLAG])) {
            trap_S_StartLocalSound(cgs.media.youHaveFlagSound, CHAN_ANNOUNCER);
        }
    }

    // lead changes
    if (!reward) {
        if (!cg.warmup) {
            // never play lead changes during warmup
            if (ps->persistent[PERS_RANK] != ops->persistent[PERS_RANK]) {
                if (cgs.gametype < GT_TEAM) {
                    if (ps->persistent[PERS_RANK] == 0) {
                        CG_AddBufferedSound(cgs.media.takenLeadSound);
                    } else if (ps->persistent[PERS_RANK] == RANK_TIED_FLAG) {
                        CG_AddBufferedSound(cgs.media.tiedLeadSound);
                    } else if ((ops->persistent[PERS_RANK] & ~RANK_TIED_FLAG) == 0) {
                        CG_AddBufferedSound(cgs.media.lostLeadSound);
                    }
                }
            }
        }
    }

    // timelimit warnings
    if (cgs.timelimit > 0) {
        int msec;

        msec = cg.time - cgs.levelStartTime;
        if (!(cg.timelimitWarnings & 4) && msec > (cgs.timelimit * 60 + 2) * 1000) {
            cg.timelimitWarnings |= 1 | 2 | 4;
            trap_S_StartLocalSound(cgs.media.suddenDeathSound, CHAN_ANNOUNCER);
        } else if (!(cg.timelimitWarnings & 2) && msec > (cgs.timelimit - 1) * 60 * 1000) {
            cg.timelimitWarnings |= 1 | 2;
            trap_S_StartLocalSound(cgs.media.oneMinuteSound, CHAN_ANNOUNCER);
        } else if (cgs.timelimit > 5 && !(cg.timelimitWarnings & 1) && msec > (cgs.timelimit - 5) * 60 * 1000) {
            cg.timelimitWarnings |= 1;
            trap_S_StartLocalSound(cgs.media.fiveMinuteSound, CHAN_ANNOUNCER);
        }
    }

    // fraglimit warnings
    if (cgs.fraglimit > 0 && cgs.gametype < GT_CTF) {
        highScore = cgs.scores1;
        if (!(cg.fraglimitWarnings & 4) && highScore == (cgs.fraglimit - 1)) {
            cg.fraglimitWarnings |= 1 | 2 | 4;
            CG_AddBufferedSound(cgs.media.oneFragSound);
        } else if (cgs.fraglimit > 2 && !(cg.fraglimitWarnings & 2) && highScore == (cgs.fraglimit - 2)) {
            cg.fraglimitWarnings |= 1 | 2;
            CG_AddBufferedSound(cgs.media.twoFragSound);
        } else if (cgs.fraglimit > 3 && !(cg.fraglimitWarnings & 1) && highScore == (cgs.fraglimit - 3)) {
            cg.fraglimitWarnings |= 1;
            CG_AddBufferedSound(cgs.media.threeFragSound);
        }
    }
}

void CG_TransitionPlayerState(playerState_t* ps, playerState_t* ops)
{
    // check for changing follow mode
    if (ps->clientNum != ops->clientNum) {
        cg.thisFrameTeleport = true;
        // make sure we don't get any unwanted transition effects
        *ops = *ps;
    }

    // damage events (player is getting wounded)
    if (ps->damageEvent != ops->damageEvent && ps->damageCount) {
        CG_DamageFeedback(ps->damageYaw, ps->damagePitch, ps->damageCount);
    }

    // respawning
    if (ps->persistent[PERS_SPAWN_COUNT] != ops->persistent[PERS_SPAWN_COUNT]) {
        CG_Respawn();
    }

    if (cg.mapRestart) {
        CG_Respawn();
        cg.mapRestart = false;
    }

    if (cg.snap->ps.pm_type != PM_INTERMISSION
        && ps->persistent[PERS_TEAM] != TEAM_SPECTATOR) {
        CG_CheckLocalSounds(ps, ops);
    }

    // check for going low on ammo
    CG_CheckAmmo();

    // run events
    CG_CheckPlayerstateEvents(ps, ops);

    // smooth the ducking viewheight change
    if (ps->viewheight != ops->viewheight) {
        cg.duckChange = ps->viewheight - ops->viewheight;
        cg.duckTime = cg.time;
    }
}
