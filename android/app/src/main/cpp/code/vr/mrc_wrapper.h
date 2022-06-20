#ifndef __MRC_WRAPPER
#define __MRC_WRAPPER

#include <openxr/openxr.h>
#include "vr_types.h"

#define MRC_MAX_CAMERA_COUNT 8

typedef struct {
    XrFovf fov;
    XrPosef pose;
} MRCCamera;

typedef struct {
    MRCCamera camera[MRC_MAX_CAMERA_COUNT];
    int cameraCount;
} MRCCameraSet;


typedef struct {
    int width;
    int height;
} MRCResolution;

#ifdef __cplusplus
extern "C" {
#endif

void MRC_Init( ovrJava java );
void MRC_Destroy( void );
MRCCameraSet MRC_GetCamera( void );
MRCResolution MRC_GetResolution();
void MRC_Update(void* texture, double timestamp);

#ifdef __cplusplus
}
#endif

#endif
