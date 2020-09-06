#include "vr_renderer.h"

#include "../qcommon/q_shared.h"
#include "../qcommon/qcommon.h"
#include "../client/client.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
#include <VrApi_Helpers.h>
#pragma clang diagnostic pop

#include <assert.h>
#include <stdlib.h>
#include <string.h>

#define ENABLE_GL_DEBUG 1
#define ENABLE_GL_DEBUG_VERBOSE 0
#if ENABLE_GL_DEBUG
#include <GLES3/gl32.h>
#endif

void APIENTRY VR_GLDebugLog(GLenum source, GLenum type, GLuint id,
	GLenum severity, GLsizei length, const GLchar* message, const void* userParam)
{
	if (type == GL_DEBUG_TYPE_ERROR || type == GL_DEBUG_TYPE_PERFORMANCE || ENABLE_GL_DEBUG_VERBOSE)
	{
		Com_Printf("GL CALLBACK: %s type = 0x%x, severity = 0x%x, message = %s\n",
			(type == GL_DEBUG_TYPE_ERROR ? "** GL ERROR **" : ""), type, severity, message);
	}
}

void VR_InitRenderer( engine_t* engine ) {
#if ENABLE_GL_DEBUG
	glEnable(GL_DEBUG_OUTPUT);
	glDebugMessageCallback(VR_GLDebugLog, 0);
#endif

	int eyeW, eyeH;

	eyeW = 1440; // vrapi_GetSystemPropertyInt(&java, VRAPI_SYS_PROP_SUGGESTED_EYE_TEXTURE_WIDTH);
	eyeH = 1600; // vrapi_GetSystemPropertyInt(&java, VRAPI_SYS_PROP_SUGGESTED_EYE_TEXTURE_HEIGHT);
	for (int eye = 0; eye < VRAPI_FRAME_LAYER_EYE_MAX; ++eye) {
		framebuffer_t* framebuffer = &engine->framebuffers[eye];
		framebuffer->colorTexture = vrapi_CreateTextureSwapChain3(VRAPI_TEXTURE_TYPE_2D, GL_RGBA8,
			eyeW, eyeH, 1, 3);
		framebuffer->swapchainLength = vrapi_GetTextureSwapChainLength(framebuffer->colorTexture);
		framebuffer->depthBuffers = (GLuint*)malloc(framebuffer->swapchainLength * sizeof(GLuint));
		framebuffer->framebuffers = (GLuint*)malloc(framebuffer->swapchainLength * sizeof(GLuint));

		for (int index = 0; index < framebuffer->swapchainLength; ++index) {
			GLuint colorTexture;
			GLenum framebufferStatus;

			colorTexture = vrapi_GetTextureSwapChainHandle(framebuffer->colorTexture, index);
			glBindTexture(GL_TEXTURE_2D, colorTexture);
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
			glBindTexture(GL_TEXTURE_2D, 0);

			glGenRenderbuffers(1, &framebuffer->depthBuffers[index]);
			glBindRenderbuffer(GL_RENDERBUFFER, framebuffer->depthBuffers[index]);
			glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT24, eyeW, eyeH);
			glBindRenderbuffer(GL_RENDERBUFFER, 0);

			glGenFramebuffers(1, &framebuffer->framebuffers[index]);
			glBindFramebuffer(GL_DRAW_FRAMEBUFFER, framebuffer->framebuffers[index]);
			glFramebufferRenderbuffer(GL_DRAW_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER,
				framebuffer->depthBuffers[index]);
			glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, colorTexture, 0);
			framebufferStatus = glCheckFramebufferStatus(GL_DRAW_FRAMEBUFFER);
			assert(framebufferStatus == GL_FRAMEBUFFER_COMPLETE);
			glBindFramebuffer(GL_DRAW_FRAMEBUFFER, 0);
		}
	}
}

void VR_DestroyRenderer( engine_t* engine ) {
	for (int eye = 0; eye < VRAPI_FRAME_LAYER_EYE_MAX; ++eye)
	{
		if (engine->framebuffers[eye].swapchainLength > 0) {
			glDeleteFramebuffers(engine->framebuffers[eye].swapchainLength,
				engine->framebuffers[eye].depthBuffers);
			free(engine->framebuffers[eye].depthBuffers);
			free(engine->framebuffers[eye].framebuffers);

			vrapi_DestroyTextureSwapChain(engine->framebuffers[eye].colorTexture);

			memset(&engine->framebuffers[eye], 0, sizeof(engine->framebuffers[eye]));
		}
	}

}

void VR_DrawFrame( engine_t* engine ) {
	double predictedDisplayTime;
	ovrTracking2 tracking;
	ovrLayerProjection2 layer;

	if (!engine->ovr)
	{
		return;
	}

	++engine->frameIndex;
	predictedDisplayTime = vrapi_GetPredictedDisplayTime(engine->ovr, engine->frameIndex);
	tracking = vrapi_GetPredictedTracking2(engine->ovr, predictedDisplayTime);

	layer = vrapi_DefaultLayerProjection2();
	layer.HeadPose = tracking.HeadPose;

	for (int eye = 0; eye < VRAPI_FRAME_LAYER_EYE_MAX; ++eye) {
		layer.Textures[eye].ColorSwapChain = engine->framebuffers[eye].colorTexture;
		layer.Textures[eye].SwapChainIndex = engine->framebuffers[eye].swapchainIndex;
		layer.Textures[eye].TexCoordsFromTanAngles = ovrMatrix4f_TanAngleMatrixFromProjection(&tracking.Eye[eye].ProjectionMatrix);
	}

	const framebuffer_t* framebuffers = engine->framebuffers;
	re.SetVRHeadsetParms(&tracking,
		framebuffers[0].framebuffers[framebuffers[0].swapchainIndex],
		framebuffers[1].framebuffers[framebuffers[1].swapchainIndex]);
	Com_Frame();

	for (int eye = 0; eye < VRAPI_FRAME_LAYER_EYE_MAX; ++eye) {
		engine->framebuffers[eye].swapchainIndex = (engine->framebuffers[eye].swapchainIndex + 1) %
			engine->framebuffers[eye].swapchainLength;
	}

	const ovrLayerHeader2* layers[] = {
		&layer.Header
	};

	ovrSubmitFrameDescription2 frameDesc = { 0 };
	frameDesc.Flags = 0;
	frameDesc.SwapInterval = 1;
	frameDesc.FrameIndex = engine->frameIndex;
	frameDesc.DisplayTime = predictedDisplayTime;
	frameDesc.LayerCount = 1;
	frameDesc.Layers = layers;

	vrapi_SubmitFrame2(engine->ovr, &frameDesc);
}
