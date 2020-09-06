#include "vr_input.h"

#if __ANDROID__

#include "../qcommon/q_shared.h"
#include "../qcommon/qcommon.h"
#include "../client/keycodes.h"
#include "vr_base.h"
#include "VrApi_Input.h"

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

static qboolean controllerInit = qfalse;

static vrController_t leftController;
static vrController_t rightController;
static int in_vrEventTime = 0;

static float pressedThreshold = 0.75f;
static float releasedThreshold = 0.5f;

extern cvar_t *cl_sensitivity;
extern cvar_t *m_pitch;
extern cvar_t *m_yaw;

static void IN_VRJoystick( qboolean isRightController, float joystickX, float joystickY )
{
	vrController_t* controller = isRightController == qtrue ? &rightController : &leftController;

	// Menu controls mapped to keyboard codes...
	if (isRightController == qfalse) {
		if (!(controller->axisButtons & VR_TOUCH_AXIS_UP) && joystickY > pressedThreshold) {
			controller->axisButtons |= VR_TOUCH_AXIS_UP;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_UPARROW, qtrue, 0, NULL);
		} else if ((controller->axisButtons & VR_TOUCH_AXIS_UP) && joystickY < releasedThreshold) {
			controller->axisButtons &= ~VR_TOUCH_AXIS_UP;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_UPARROW, qfalse, 0, NULL);
		}

		if (!(controller->axisButtons & VR_TOUCH_AXIS_DOWN) && joystickY < -pressedThreshold) {
			controller->axisButtons |= VR_TOUCH_AXIS_DOWN;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_DOWNARROW, qtrue, 0, NULL);
		} else if ((controller->axisButtons & VR_TOUCH_AXIS_DOWN) && joystickY > -releasedThreshold) {
			controller->axisButtons &= ~VR_TOUCH_AXIS_DOWN;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_DOWNARROW, qfalse, 0, NULL);
		}

		if (!(controller->axisButtons & VR_TOUCH_AXIS_LEFT) && joystickX < -pressedThreshold) {
			controller->axisButtons |= VR_TOUCH_AXIS_LEFT;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_LEFTARROW, qtrue, 0, NULL);
		} else if ((controller->axisButtons & VR_TOUCH_AXIS_LEFT) && joystickX > -releasedThreshold) {
			controller->axisButtons &= ~VR_TOUCH_AXIS_LEFT;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_LEFTARROW, qfalse, 0, NULL);
		}

		if (!(controller->axisButtons & VR_TOUCH_AXIS_RIGHT) && joystickX > pressedThreshold) {
			controller->axisButtons |= VR_TOUCH_AXIS_RIGHT;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_RIGHTARROW, qtrue, 0, NULL);
		} else if ((controller->axisButtons & VR_TOUCH_AXIS_RIGHT) && joystickX < releasedThreshold) {
			controller->axisButtons &= ~VR_TOUCH_AXIS_RIGHT;
			Com_QueueEvent(in_vrEventTime, SE_KEY, K_RIGHTARROW, qfalse, 0, NULL);
		}
	} else {
		const float sensitivity = cl_sensitivity->value;
		const float x = joystickX * sensitivity * m_yaw->value;
		const float y = joystickY * sensitivity * -m_pitch->value;
		Com_QueueEvent(in_vrEventTime, SE_MOUSE, x, y, 0, NULL);
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

	if ((buttons & ovrButton_A) && !(controller->buttons & ovrButton_A)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_A, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_A) && (controller->buttons & ovrButton_A)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_A, qfalse, 0, NULL);
	}

	if ((buttons & ovrButton_B) && !(controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_B, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_B) && (controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_B, qfalse, 0, NULL);
	}

	if ((buttons & ovrButton_X) && !(controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_X, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_B) && (controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_X, qfalse, 0, NULL);
	}

	if ((buttons & ovrButton_Y) && !(controller->buttons & ovrButton_B)) {
		Com_QueueEvent(in_vrEventTime, SE_KEY, K_PAD0_Y, qtrue, 0, NULL);
	} else if (!(buttons & ovrButton_B) && (controller->buttons & ovrButton_B)) {
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

		IN_VRJoystick(isRight, state.JoystickNoDeadZone.x, state.JoystickNoDeadZone.y);
		IN_VRTriggers(isRight, state.IndexTrigger);

		if (controller->buttons ^ state.Buttons) {
			IN_VRButtonsChanged(isRight, state.Buttons);
		}
	}

	in_vrEventTime = Sys_Milliseconds( );
}

#endif
