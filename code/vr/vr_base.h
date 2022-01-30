#ifndef __VR_BASE
#define __VR_BASE

#if __ANDROID__

#include "vr_types.h"

#define PLAYER_HEIGHT           48

engine_t* VR_Init( ovrJava java );
void VR_InitCvars( void );
void VR_Destroy( engine_t* engine );
void VR_EnterVR( engine_t* engine, ovrJava java );
void VR_LeaveVR( engine_t* engine );

engine_t* VR_GetEngine( void );
bool VR_useScreenLayer( void );

#endif

#endif
