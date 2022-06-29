#ifndef __VR_INPUT_H
#define __VR_INPUT_H

#include "../qcommon/q_shared.h"
#include "vr_types.h"

#if __ANDROID__

void IN_VRInputFrame(void);
void IN_VRInit(void);
void IN_VRSyncActions(void);
void IN_VRUpdateControllers(XrPosef xfStageFromHead, float predictedDisplayTime);
void IN_VRUpdateHMD(XrPosef xfStageFromHead);
void IN_VRUpdateMRC(XrPosef xfStageFromMrc, XrPosef xfStageFromHead);

void QuatToYawPitchRoll(XrQuaternionf q, vec3_t rotation, vec3_t out);

#endif

#endif
