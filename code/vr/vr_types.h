#ifndef __VR_TYPES
#define __VR_TYPES

#ifdef USE_LOCAL_HEADERS
#	include "SDL_opengl.h"
#	include "SDL_opengles2.h"
#else
#	include <SDL_opengl.h>
#	include <SDL_opengles2.h>
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wstrict-prototypes"
#include <VrApi.h>
#pragma clang diagnostic pop

typedef struct {
	int swapchainLength;
	int swapchainIndex;
	ovrTextureSwapChain* colorTexture;
	GLuint* depthBuffers;
	GLuint* framebuffers;
} framebuffer_t;

typedef struct {
	uint64_t frameIndex;
	ovrMobile* ovr;
	framebuffer_t framebuffers[VRAPI_FRAME_LAYER_EYE_MAX];
} engine_t;

#endif
