/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.
Copyright (C) 2005 Stuart Dalton (badcdev@gmail.com)

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

#include "client.h"
#include "snd_codec.h"
#include "snd_local.h"
#include "snd_public.h"

cvar_t* s_volume;
cvar_t* s_muted;
cvar_t* s_musicVolume;
cvar_t* s_doppler;
cvar_t* s_backend;
cvar_t* s_muteWhenMinimized;
cvar_t* s_muteWhenUnfocused;

static soundInterface_t si;

static bool S_ValidSoundInterface(soundInterface_t* si)
{
    if (!si->Shutdown)
        return false;
    if (!si->StartSound)
        return false;
    if (!si->StartLocalSound)
        return false;
    if (!si->StartBackgroundTrack)
        return false;
    if (!si->StopBackgroundTrack)
        return false;
    if (!si->RawSamples)
        return false;
    if (!si->StopAllSounds)
        return false;
    if (!si->ClearLoopingSounds)
        return false;
    if (!si->AddLoopingSound)
        return false;
    if (!si->AddRealLoopingSound)
        return false;
    if (!si->StopLoopingSound)
        return false;
    if (!si->Respatialize)
        return false;
    if (!si->UpdateEntityPosition)
        return false;
    if (!si->Update)
        return false;
    if (!si->DisableSounds)
        return false;
    if (!si->BeginRegistration)
        return false;
    if (!si->RegisterSound)
        return false;
    if (!si->ClearSoundBuffer)
        return false;
    if (!si->SoundInfo)
        return false;
    if (!si->SoundList)
        return false;

#ifdef USE_VOIP
    if (!si->StartCapture)
        return false;
    if (!si->AvailableCaptureSamples)
        return false;
    if (!si->Capture)
        return false;
    if (!si->StopCapture)
        return false;
    if (!si->MasterGain)
        return false;
#endif

    return true;
}

void S_StartSound(vec3_t origin, int entnum, int entchannel, sfxHandle_t sfx)
{
    if (si.StartSound) {
        si.StartSound(origin, entnum, entchannel, sfx);
    }
}

void S_StartLocalSound(sfxHandle_t sfx, int channelNum)
{
    if (si.StartLocalSound) {
        si.StartLocalSound(sfx, channelNum);
    }
}

void S_StartBackgroundTrack(const char* intro, const char* loop)
{
    if (si.StartBackgroundTrack) {
        si.StartBackgroundTrack(intro, loop);
    }
}

void S_StopBackgroundTrack(void)
{
    if (si.StopBackgroundTrack) {
        si.StopBackgroundTrack();
    }
}

void S_RawSamples(int stream, int samples, int rate, int width, int channels,
                  const uint8_t* data, float volume, int entityNum)
{
    if (si.RawSamples)
        si.RawSamples(stream, samples, rate, width, channels, data, volume, entityNum);
}

void S_StopAllSounds(void)
{
    if (si.StopAllSounds) {
        si.StopAllSounds();
    }
}

void S_ClearLoopingSounds(bool killall)
{
    if (si.ClearLoopingSounds) {
        si.ClearLoopingSounds(killall);
    }
}

void S_AddLoopingSound(int entityNum, const vec3_t origin,
                       const vec3_t velocity, sfxHandle_t sfx)
{
    if (si.AddLoopingSound) {
        si.AddLoopingSound(entityNum, origin, velocity, sfx);
    }
}

void S_AddRealLoopingSound(int entityNum, const vec3_t origin,
                           const vec3_t velocity, sfxHandle_t sfx)
{
    if (si.AddRealLoopingSound) {
        si.AddRealLoopingSound(entityNum, origin, velocity, sfx);
    }
}

void S_StopLoopingSound(int entityNum)
{
    if (si.StopLoopingSound) {
        si.StopLoopingSound(entityNum);
    }
}

void S_Respatialize(int entityNum, const vec3_t origin,
                    vec3_t axis[3], int inwater)
{
    if (si.Respatialize) {
        si.Respatialize(entityNum, origin, axis, inwater);
    }
}

void S_UpdateEntityPosition(int entityNum, const vec3_t origin)
{
    if (si.UpdateEntityPosition) {
        si.UpdateEntityPosition(entityNum, origin);
    }
}

void S_Update(void)
{
    if (s_muted->integer) {
        if (!(s_muteWhenMinimized->integer && com_minimized->integer) && !(s_muteWhenUnfocused->integer && com_unfocused->integer)) {
            s_muted->integer = false;
            s_muted->modified = true;
        }
    } else {
        if ((s_muteWhenMinimized->integer && com_minimized->integer) || (s_muteWhenUnfocused->integer && com_unfocused->integer)) {
            s_muted->integer = true;
            s_muted->modified = true;
        }
    }

    if (si.Update) {
        si.Update();
    }
}

void S_DisableSounds(void)
{
    if (si.DisableSounds) {
        si.DisableSounds();
    }
}

void S_BeginRegistration(void)
{
    if (si.BeginRegistration) {
        si.BeginRegistration();
    }
}

sfxHandle_t S_RegisterSound(const char* sample, bool compressed)
{
    if (si.RegisterSound) {
        return si.RegisterSound(sample, compressed);
    } else {
        return 0;
    }
}

void S_ClearSoundBuffer(void)
{
    if (si.ClearSoundBuffer) {
        si.ClearSoundBuffer();
    }
}

void S_SoundInfo(void)
{
    if (si.SoundInfo) {
        si.SoundInfo();
    }
}

void S_SoundList(void)
{
    if (si.SoundList) {
        si.SoundList();
    }
}

#ifdef USE_VOIP
void S_StartCapture(void)
{
    if (si.StartCapture) {
        si.StartCapture();
    }
}

int S_AvailableCaptureSamples(void)
{
    if (si.AvailableCaptureSamples) {
        return si.AvailableCaptureSamples();
    }
    return 0;
}

void S_Capture(int samples, uint8_t* data)
{
    if (si.Capture) {
        si.Capture(samples, data);
    }
}

void S_StopCapture(void)
{
    if (si.StopCapture) {
        si.StopCapture();
    }
}

void S_MasterGain(float gain)
{
    if (si.MasterGain) {
        si.MasterGain(gain);
    }
}
#endif

//=============================================================================

void S_Play_f(void)
{
    int i;
    int c;
    sfxHandle_t h;

    if (!si.RegisterSound || !si.StartLocalSound) {
        return;
    }

    c = Cmd_Argc();

    if (c < 2) {
        Com_Printf("Usage: play <sound filename> [sound filename] [sound filename] ...\n");
        return;
    }

    for (i = 1; i < c; i++) {
        h = si.RegisterSound(Cmd_Argv(i), false);

        if (h) {
            si.StartLocalSound(h, CHAN_LOCAL_SOUND);
        }
    }
}

void S_Music_f(void)
{
    int c;

    if (!si.StartBackgroundTrack) {
        return;
    }

    c = Cmd_Argc();

    if (c == 2) {
        si.StartBackgroundTrack(Cmd_Argv(1), NULL);
    } else if (c == 3) {
        si.StartBackgroundTrack(Cmd_Argv(1), Cmd_Argv(2));
    } else {
        Com_Printf("Usage: music <musicfile> [loopfile]\n");
        return;
    }
}

void S_StopMusic_f(void)
{
    if (!si.StopBackgroundTrack)
        return;

    si.StopBackgroundTrack();
}

//=============================================================================

void S_Init(void)
{
    cvar_t* cv;
    bool started = false;

    Com_Printf("------ Initializing Sound ------\n");

    s_volume = Cvar_Get("s_volume", "0.8", CVAR_ARCHIVE);
    s_musicVolume = Cvar_Get("s_musicvolume", "0.25", CVAR_ARCHIVE);
    s_muted = Cvar_Get("s_muted", "0", CVAR_ROM);
    s_doppler = Cvar_Get("s_doppler", "1", CVAR_ARCHIVE);
    s_backend = Cvar_Get("s_backend", "", CVAR_ROM);
    s_muteWhenMinimized = Cvar_Get("s_muteWhenMinimized", "0", CVAR_ARCHIVE);
    s_muteWhenUnfocused = Cvar_Get("s_muteWhenUnfocused", "0", CVAR_ARCHIVE);

    cv = Cvar_Get("s_initsound", "1", 0);
    if (!cv->integer) {
        Com_Printf("Sound disabled.\n");
    } else {

        S_CodecInit();

        Cmd_AddCommand("play", S_Play_f);
        Cmd_AddCommand("music", S_Music_f);
        Cmd_AddCommand("stopmusic", S_StopMusic_f);
        Cmd_AddCommand("s_list", S_SoundList);
        Cmd_AddCommand("s_stop", S_StopAllSounds);
        Cmd_AddCommand("s_info", S_SoundInfo);

        cv = Cvar_Get("s_useOpenAL", "1", CVAR_ARCHIVE | CVAR_LATCH);
        if (cv->integer) {
            // OpenAL
            started = S_AL_Init(&si);
            Cvar_Set("s_backend", "OpenAL");
        }

        if (!started) {
            started = S_Base_Init(&si);
            Cvar_Set("s_backend", "base");
        }

        if (started) {
            if (!S_ValidSoundInterface(&si)) {
                Com_Error(ERR_FATAL, "Sound interface invalid");
            }

            S_SoundInfo();
            Com_Printf("Sound initialization successful.\n");
        } else {
            Com_Printf("Sound initialization failed.\n");
        }
    }

    Com_Printf("--------------------------------\n");
}

void S_Shutdown(void)
{
    if (si.Shutdown) {
        si.Shutdown();
    }

    memset(&si, 0, sizeof(soundInterface_t));

    Cmd_RemoveCommand("play");
    Cmd_RemoveCommand("music");
    Cmd_RemoveCommand("stopmusic");
    Cmd_RemoveCommand("s_list");
    Cmd_RemoveCommand("s_stop");
    Cmd_RemoveCommand("s_info");

    S_CodecShutdown();
}
