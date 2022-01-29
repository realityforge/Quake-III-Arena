#include "vr_base.h"
#include "../VrApi/Include/VrApi_Types.h"
#include "../qcommon/q_shared.h"
#include "../qcommon/qcommon.h"
#include "../client/client.h"

//#if __ANDROID__

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
#include "../VrApi/Include/VrApi_Helpers.h"
#pragma clang diagnostic pop

#include <EGL/egl.h>

#include <assert.h>

static engine_t vr_engine;

engine_t* VR_Init( ovrJava java )
{
	ovrInitParms initParams;
	ovrResult initResult;

	memset(&vr_engine, 0, sizeof(vr_engine));

	initParams = vrapi_DefaultInitParms(&java);
	initResult = vrapi_Initialize(&initParams);
	assert(initResult == VRAPI_INITIALIZE_SUCCESS);
	
	vr_engine.java = java;

	return &vr_engine;
}

void VR_Destroy( engine_t* engine )
{
	if (engine == &vr_engine) {
		vrapi_Shutdown();
	}
}

void VR_EnterVR( engine_t* engine, ovrJava java ) {
	if (!engine->ovr) {
		ovrModeParms modeParams = vrapi_DefaultModeParms(&java);
		modeParams.Display = (size_t)eglGetCurrentDisplay();
		modeParams.WindowSurface = (size_t)eglGetCurrentSurface(EGL_DRAW);
		modeParams.ShareContext = (size_t)eglGetCurrentContext();

		engine->ovr = vrapi_EnterVrMode(&modeParams);
		engine->frameIndex = 0;

		vrapi_SetTrackingSpace(engine->ovr, VRAPI_TRACKING_SPACE_LOCAL_FLOOR);
	}
}

void VR_LeaveVR( engine_t* engine ) {
	if (engine->ovr) {
		vrapi_LeaveVrMode(engine->ovr);
		engine->ovr = NULL;
	}
}

engine_t* VR_GetEngine( void ) {
	return &vr_engine;
}

bool VR_useScreenLayer( void )
{
	return (bool)(clc.state != CA_ACTIVE ||
			( Key_GetCatcher( ) & KEYCATCH_UI ) ||
            ( Key_GetCatcher( ) & KEYCATCH_CONSOLE ));
}
//#endif
