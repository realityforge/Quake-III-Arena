#include "vr_input.h"

//#if __ANDROID__

#include "../qcommon/q_shared.h"
#include "../qcommon/qcommon.h"
#include "../client/keycodes.h"
#include "vr_base.h"
#include "../VrApi/Include/VrApi_Input.h"
#include "../VrApi/Include/VrApi_Helpers.h"
#include "vr_clientinfo.h"

#include <unistd.h>

#ifdef USE_LOCAL_HEADERS
#	include "SDL.h"
#else
#	include <SDL.h>
#endif

enum {
	VR_TOUCH_AXIS_UP = 1 << 0,
	VR_TOUCH_AXIS_DOWN = 1 << 1,
	VR_TOUCH_AXIS_LEFT = 1 << 2,
	VR_TOUCH_AXIS_RIGHT = 1 << 3,
	VR_TOUCH_AXIS_TRIGGER_INDEX = 1 << 4,
};

typedef struct {
	uint32_t buttons;
	uint32_t axisButtons;
} vrController_t;

vr_clientinfo_t vr;

static qboolean controllerInit = qfalse;

static vrController_t leftController;
static vrController_t rightController;
static int in_vrEventTime = 0;

static float pressedThreshold = 0.75f;
static float releasedThreshold = 0.5f;

extern cvar_t *cl_sensitivity;
extern cvar_t *m_pitch;
extern cvar_t *m_yaw;

cvar_t	*vr_righthanded;
cvar_t	*vr_snapturn;


float radians(float deg) {
    return (deg * M_PI) / 180.0;
}

float degrees(float rad) {
    return (rad * 180.0) / M_PI;
}


#ifndef EPSILON
#define EPSILON 0.001f
#endif

cvar_t  *vr_extralatencymode = NULL;

void rotateAboutOrigin(float x, float y, float rotation, vec2_t out)
{
	out[0] = cosf(DEG2RAD(-rotation)) * x  +  sinf(DEG2RAD(-rotation)) * y;
	out[1] = cosf(DEG2RAD(-rotation)) * y  -  sinf(DEG2RAD(-rotation)) * x;
}

static ovrVector3f normalizeVec(ovrVector3f vec) {
    //NOTE: leave w-component untouched
    //@@const float EPSILON = 0.000001f;
    float xxyyzz = vec.x*vec.x + vec.y*vec.y + vec.z*vec.z;
    //@@if(xxyyzz < EPSILON)
    //@@    return *this; // do nothing if it is zero vector

    //float invLength = invSqrt(xxyyzz);
    ovrVector3f result;
    float invLength = 1.0f / sqrtf(xxyyzz);
    result.x = vec.x * invLength;
    result.y = vec.y * invLength;
    result.z = vec.z * invLength;
    return result;
}

void NormalizeAngles(vec3_t angles)
{
    while (angles[0] >= 90) angles[0] -= 180;
    while (angles[1] >= 180) angles[1] -= 360;
    while (angles[2] >= 180) angles[2] -= 360;
    while (angles[0] < -90) angles[0] += 180;
    while (angles[1] < -180) angles[1] += 360;
    while (angles[2] < -180) angles[2] += 360;
}

void GetAnglesFromVectors(const ovrVector3f forward, const ovrVector3f right, const ovrVector3f up, vec3_t angles)
{
    float sr, sp, sy, cr, cp, cy;

    sp = -forward.z;

    float cp_x_cy = forward.x;
    float cp_x_sy = forward.y;
    float cp_x_sr = -right.z;
    float cp_x_cr = up.z;

    float yaw = atan2(cp_x_sy, cp_x_cy);
    float roll = atan2(cp_x_sr, cp_x_cr);

    cy = cos(yaw);
    sy = sin(yaw);
    cr = cos(roll);
    sr = sin(roll);

    if (fabs(cy) > EPSILON)
    {
        cp = cp_x_cy / cy;
    }
    else if (fabs(sy) > EPSILON)
    {
        cp = cp_x_sy / sy;
    }
    else if (fabs(sr) > EPSILON)
    {
        cp = cp_x_sr / sr;
    }
    else if (fabs(cr) > EPSILON)
    {
        cp = cp_x_cr / cr;
    }
    else
    {
        cp = cos(asin(sp));
    }

    float pitch = atan2(sp, cp);

    angles[0] = pitch / (M_PI*2.f / 360.f);
    angles[1] = yaw / (M_PI*2.f / 360.f);
    angles[2] = roll / (M_PI*2.f / 360.f);

    NormalizeAngles(angles);
}

void QuatToYawPitchRoll(ovrQuatf q, vec3_t rotation, vec3_t out) {

    ovrMatrix4f mat = ovrMatrix4f_CreateFromQuaternion( &q );

    if (rotation[0] != 0.0f || rotation[1] != 0.0f || rotation[2] != 0.0f)
    {
        ovrMatrix4f rot = ovrMatrix4f_CreateRotation(radians(rotation[0]), radians(rotation[1]), radians(rotation[2]));
        mat = ovrMatrix4f_Multiply(&mat, &rot);
    }

    ovrVector4f v1 = {0, 0, -1, 0};
    ovrVector4f v2 = {1, 0, 0, 0};
    ovrVector4f v3 = {0, 1, 0, 0};

    ovrVector4f forwardInVRSpace = ovrVector4f_MultiplyMatrix4f(&mat, &v1);
    ovrVector4f rightInVRSpace = ovrVector4f_MultiplyMatrix4f(&mat, &v2);
    ovrVector4f upInVRSpace = ovrVector4f_MultiplyMatrix4f(&mat, &v3);

    ovrVector3f forward = {-forwardInVRSpace.z, -forwardInVRSpace.x, forwardInVRSpace.y};
    ovrVector3f right = {-rightInVRSpace.z, -rightInVRSpace.x, rightInVRSpace.y};
    ovrVector3f up = {-upInVRSpace.z, -upInVRSpace.x, upInVRSpace.y};

    ovrVector3f forwardNormal = normalizeVec(forward);
    ovrVector3f rightNormal = normalizeVec(right);
    ovrVector3f upNormal = normalizeVec(up);

    GetAnglesFromVectors(forwardNormal, rightNormal, upNormal, out);
}

void sendButtonActionSimple(const char* action)
{
    char command[256];
    snprintf( command, sizeof( command ), "%s\n", action );
    Cbuf_AddText( command );
}


void IN_VRInit( void )
{
	vr_righthanded = Cvar_Get ("vr_righthanded", "1", CVAR_ARCHIVE);
	vr_snapturn = Cvar_Get ("vr_snapturn", "1", CVAR_ARCHIVE);
    vr_extralatencymode = Cvar_Get ("vr_extralatencymode", "1", CVAR_ARCHIVE);
}

static void IN_VRController( qboolean isRightController, ovrTracking remoteTracking )
{
	if (isRightController == (vr_righthanded->integer != 0))
	{
		//Set gun angles - We need to calculate all those we might need (including adjustments) for the client to then take its pick
		vec3_t rotation = {0};
		rotation[PITCH] =-20.0f;
		QuatToYawPitchRoll(remoteTracking.HeadPose.Pose.Orientation, rotation, vr.weaponangles);

		VectorSubtract(vr.weaponangles_last, vr.weaponangles, vr.weaponangles_delta);
		VectorCopy(vr.weaponangles, vr.weaponangles_last);


		//Record recent weapon position for trajectory based stuff
		for (int i = (NUM_WEAPON_SAMPLES-1); i != 0; --i)
		{
			VectorCopy(vr.weaponoffset_history[i-1], vr.weaponoffset_history[i]);
			vr.weaponoffset_history_timestamp[i] = vr.weaponoffset_history_timestamp[i-1];
		}
		VectorCopy(vr.current_weaponoffset, vr.weaponoffset_history[0]);
		vr.weaponoffset_history_timestamp[0] = vr.current_weaponoffset_timestamp;

		///Weapon location relative to view
		vr.current_weaponoffset[0] = remoteTracking.HeadPose.Pose.Position.x - vr.hmdposition[0];
		vr.current_weaponoffset[1] = remoteTracking.HeadPose.Pose.Position.y - vr.hmdposition[1];
		vr.current_weaponoffset[2] = remoteTracking.HeadPose.Pose.Position.z - vr.hmdposition[2];
		vr.current_weaponoffset_timestamp = Sys_Milliseconds( );

		//Just copy to calculated offset, used to use this in case we wanted to apply any modifiers, but don't any more
		VectorCopy(vr.current_weaponoffset, vr.calculated_weaponoffset);

	}
}

static void IN_VRJoystick( qboolean isRightController, float joystickX, float joystickY )
{
	vrController_t* controller = isRightController == qtrue ? &rightController : &leftController;

    //Positional movement speed correction for when we are not hitting target framerate
    static double lastframetime = 0;
    int refresh = vrapi_GetSystemPropertyInt(&(VR_GetEngine()->java), VRAPI_SYS_PROP_DISPLAY_REFRESH_RATE);
    double newframetime = Sys_Milliseconds();
    float multiplier = (float)((1000.0 / refresh) / (newframetime - lastframetime));
    lastframetime = newframetime;

    vec2_t positional;
    float factor = (refresh / 72.0F) * 10.0f; // adjust positional factor based on refresh rate
    rotateAboutOrigin(-vr.hmdposition_delta[0] * factor * multiplier,
                      vr.hmdposition_delta[2] * factor * multiplier, - vr.hmdorientation[YAW], positional);

	if (vr.virtual_screen)
	{
		const float x = joystickX * 5.0;
		const float y = joystickY * -5.0;

		Com_QueueEvent(in_vrEventTime, SE_MOUSE, x, y, 0, NULL);
	} else
	{
		if (isRightController == qfalse) {
            //sideways
            Com_QueueEvent(in_vrEventTime, SE_JOYSTICK_AXIS, 0, joystickX * 127.0f + positional[0] * 127.0f, 0, NULL);

            //forward/back
            Com_QueueEvent(in_vrEventTime, SE_JOYSTICK_AXIS, 1, joystickY * 127.0f + positional[1] * 127.0f, 0, NULL);
        }
        else //right controller
        {
            //yaw
            if (vr_snapturn->integer)
			{
				if (!(controller->axisButtons & VR_TOUCH_AXIS_RIGHT) && joystickX > pressedThreshold) {
					controller->axisButtons |= VR_TOUCH_AXIS_RIGHT;
					CL_SnapTurn(45);
				} else if ((controller->axisButtons & VR_TOUCH_AXIS_RIGHT) &&
						joystickX < releasedThreshold) {
					controller->axisButtons &= ~VR_TOUCH_AXIS_RIGHT;
				}

				if (!(controller->axisButtons & VR_TOUCH_AXIS_LEFT) && joystickX < -pressedThreshold) {
					controller->axisButtons |= VR_TOUCH_AXIS_LEFT;
					CL_SnapTurn(-45);
				} else if ((controller->axisButtons & VR_TOUCH_AXIS_LEFT) &&
						   joystickX > -releasedThreshold) {
					controller->axisButtons &= ~VR_TOUCH_AXIS_LEFT;
				}
			}
            else
			{
            	//smooth turn
				const float x = joystickX * cl_sensitivity->value * m_yaw->value;
				Com_QueueEvent(in_vrEventTime, SE_MOUSE, x, 0, 0, NULL);
			}

            if (!(controller->axisButtons & VR_TOUCH_AXIS_UP) && joystickY > pressedThreshold) {
                controller->axisButtons |= VR_TOUCH_AXIS_UP;
                sendButtonActionSimple("weapnext");
            } else if ((controller->axisButtons & VR_TOUCH_AXIS_UP) &&
                       joystickY < releasedThreshold) {
                controller->axisButtons &= ~VR_TOUCH_AXIS_UP;
            }

            if (!(controller->axisButtons & VR_TOUCH_AXIS_DOWN) && joystickY < -pressedThreshold) {
                controller->axisButtons |= VR_TOUCH_AXIS_DOWN;
                sendButtonActionSimple("weapprev");
            } else if ((controller->axisButtons & VR_TOUCH_AXIS_DOWN) &&
                       joystickY > -releasedThreshold) {
                controller->axisButtons &= ~VR_TOUCH_AXIS_DOWN;
            }
        }
    }
}

static void IN_VRTriggers( qboolean isRightController, float index ) {
	vrController_t* controller = isRightController == qtrue ? &rightController : &leftController;

	if (isRightController == qtrue) {
		if (!(controller->axisButtons & VR_TOUCH_AXIS_TRIGGER_INDEX) && index > pressedThreshold) {
			controller->axisButtons |= VR_TOUCH_AXIS_TRIGGER_INDEX;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_MOUSE1, qtrue, 0, NULL);
		} else if ((controller->axisButtons & VR_TOUCH_AXIS_TRIGGER_INDEX) && index < releasedThreshold) {
			controller->axisButtons &= ~VR_TOUCH_AXIS_TRIGGER_INDEX;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_MOUSE1, qfalse, 0, NULL);
		}
	}
}

static void IN_VRButtonsChanged( qboolean isRightController, uint32_t buttons )
{
	vrController_t* controller = isRightController == qtrue ? &rightController : &leftController;

	if (isRightController == qfalse)
	{
		if ((buttons & ovrButton_Enter) && !(controller->buttons & ovrButton_Enter)) {
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_ESCAPE, qtrue, 0, NULL);
		} else if (!(buttons & ovrButton_Enter) && (controller->buttons & ovrButton_Enter)) {
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_ESCAPE, qfalse, 0, NULL);
		}
	}
	
	if ((buttons & ovrButton_A) && !(controller->buttons & ovrButton_A)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_SPACE, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_A) && (controller->buttons & ovrButton_A)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_SPACE, qfalse, 0, NULL);
	}

	if ((buttons & ovrButton_B) && !(controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_ENTER, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_B) && (controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_ENTER, qfalse, 0, NULL);
	}

	if ((buttons & ovrButton_X) && !(controller->buttons & ovrButton_X)) {
		//sendButtonActionSimple("give all");
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_X, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_X) && (controller->buttons & ovrButton_X)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_X, qfalse, 0, NULL);
	}

	if ((buttons & ovrButton_Y) && !(controller->buttons & ovrButton_Y)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_Y, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_Y) && (controller->buttons & ovrButton_Y)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_Y, qfalse, 0, NULL);
	}

	controller->buttons = buttons;
}

void IN_VRInputFrame( void )
{
	if (controllerInit == qfalse) {
		memset(&leftController, 0, sizeof(leftController));
		memset(&rightController, 0, sizeof(rightController));
		controllerInit = qtrue;
	}

	ovrMobile* ovr = VR_GetEngine()->ovr;
	if (!ovr) {
		return;
	}

    ovrResult result;
	if (vr_extralatencymode != NULL &&
            vr_extralatencymode->integer) {
        result = vrapi_SetExtraLatencyMode(VR_GetEngine()->ovr, VRAPI_EXTRA_LATENCY_MODE_ON);
        assert(result == VRAPI_INITIALIZE_SUCCESS);
    }

    result = vrapi_SetClockLevels(VR_GetEngine()->ovr, 4, 4);
    assert(result == VRAPI_INITIALIZE_SUCCESS);

	vr.virtual_screen = VR_useScreenLayer();

	{
		// We extract Yaw, Pitch, Roll instead of directly using the orientation
		// to allow "additional" yaw manipulation with mouse/controller.
		const ovrQuatf quatHmd =  VR_GetEngine()->tracking.HeadPose.Pose.Orientation;
		const ovrVector3f positionHmd = VR_GetEngine()->tracking.HeadPose.Pose.Position;
		vec3_t rotation = {0, 0, 0};
		QuatToYawPitchRoll(quatHmd, rotation, vr.hmdorientation);
		VectorSet(vr.hmdposition, positionHmd.x, positionHmd.y, positionHmd.z);

		//Position
		VectorSubtract(vr.hmdposition_last, vr.hmdposition, vr.hmdposition_delta);

		//Keep this for our records
		VectorCopy(vr.hmdposition, vr.hmdposition_last);

		//Orientation
		VectorSubtract(vr.hmdorientation_last, vr.hmdorientation, vr.hmdorientation_delta);

		//Keep this for our records
		VectorCopy(vr.hmdorientation, vr.hmdorientation_last);
	}


	ovrInputCapabilityHeader capsHeader;
	uint32_t index = 0;
	for (;;) {
		ovrResult enumResult = vrapi_EnumerateInputDevices(ovr, index, &capsHeader);
		if (enumResult < 0) {
			break;
		}
		++index;
		
		if (capsHeader.Type != ovrControllerType_TrackedRemote) {
			continue;
		}

		ovrInputTrackedRemoteCapabilities caps;
		caps.Header = capsHeader;
		ovrResult capsResult = vrapi_GetInputDeviceCapabilities(ovr, &caps.Header);
		if (capsResult < 0) {
			continue;
		}

		ovrInputStateTrackedRemote state;
		state.Header.ControllerType = ovrControllerType_TrackedRemote;
		ovrResult stateResult = vrapi_GetCurrentInputState(ovr, capsHeader.DeviceID, &state.Header);
		if (stateResult < 0) {
			continue;
		}

		ovrTracking remoteTracking;
		stateResult = vrapi_GetInputTrackingState(ovr, capsHeader.DeviceID, VR_GetEngine()->predictedDisplayTime,
											 &remoteTracking);
		if (stateResult < 0) {
			continue;
		}


		qboolean isRight;
		vrController_t* controller;
		if (caps.ControllerCapabilities & ovrControllerCaps_LeftHand) {
			isRight = qfalse;
			controller = &leftController;
		} else if (caps.ControllerCapabilities & ovrControllerCaps_RightHand) {
			isRight = qtrue;
			controller = &rightController;
		}
		else {
			continue;
		}

		IN_VRController(isRight, remoteTracking);
		IN_VRJoystick(isRight, state.Joystick.x, state.Joystick.y);
		IN_VRTriggers(isRight, state.IndexTrigger);

		if (controller->buttons ^ state.Buttons) {
			IN_VRButtonsChanged(isRight, state.Buttons);
		}
	}

	in_vrEventTime = Sys_Milliseconds( );
}

//#endif
