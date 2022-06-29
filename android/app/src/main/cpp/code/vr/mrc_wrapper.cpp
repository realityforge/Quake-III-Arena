#include "mrc_wrapper.h"
#include "OVR_Mrc_Shim.h"
#include "OVR_Mrc.h"

#include <android/log.h>
#include <GLES3/gl3.h>

#define CHECK_MRC(func)                                                                   \
    {                                                                                     \
        ovrmResult res = func;                                                            \
        if (res != ovrmSuccess)                                                           \
            __android_log_print(ANDROID_LOG_ERROR, "[MRC]", "error[%d]: %s", res, #func); \
    }

unsigned char* MRC_Texture = nullptr;

void MRC_Init(ovrJava java)
{
    ovrm_LoadSharedLibrary(nullptr);
    CHECK_MRC(ovrm_GetAPIs()->Initialize(ovrm_GetAPIs(), java.Vm, java.ActivityObject));

    CHECK_MRC(ovrm_GetAPIs()->ConfigureGLES(eglGetCurrentContext(), false, false));
    CHECK_MRC(ovrm_GetAPIs()->SetMrcActivationMode(ovrmMediaMrcActivationMode_Automatic));
    CHECK_MRC(ovrm_GetAPIs()->SetMrcInputVideoBufferType(ovrmMediaInputVideoBufferType_Memory));
    CHECK_MRC(ovrm_GetAPIs()->SetMrcAudioSampleRate(22050));
}

void MRC_Destroy(void)
{
    CHECK_MRC(ovrm_GetAPIs()->Shutdown());
    ovrm_UnloadSharedLibrary();
    if (MRC_Texture)
        delete[] MRC_Texture;
    MRC_Texture = nullptr;
}

MRCCameraSet MRC_GetCamera(void)
{
    MRCCameraSet output = {};
    ovrmBool activated = ovrmBool_False;
    CHECK_MRC(ovrm_GetAPIs()->Update());
    ovrm_GetAPIs()->IsMrcActivated(&activated);
    if (activated == ovrmBool_False) {
        output.cameraCount = 0;
        return output;
    }

    CHECK_MRC(ovrm_GetAPIs()->GetExternalCameraCount(&output.cameraCount));
    for (int i = 0; i < output.cameraCount; i++) {
        ovrmCameraIntrinsics intrinsics;
        CHECK_MRC(ovrm_GetAPIs()->GetExternalCameraIntrinsics(i, &intrinsics));
        output.camera[i].fov.angleLeft = -atanf(intrinsics.FOVPort.LeftTan);
        output.camera[i].fov.angleRight = -atanf(intrinsics.FOVPort.RightTan);
        output.camera[i].fov.angleUp = atanf(intrinsics.FOVPort.UpTan);
        output.camera[i].fov.angleDown = atanf(intrinsics.FOVPort.DownTan);

        ovrmCameraExtrinsics extrinsics;
        CHECK_MRC(ovrm_GetAPIs()->GetExternalCameraExtrinsics(i, &extrinsics));
        output.camera[i].pose.position.x = -extrinsics.RelativePose.Position.x * 100.0f;
        output.camera[i].pose.position.y = extrinsics.RelativePose.Position.z * 100.0f;
        output.camera[i].pose.position.z = extrinsics.RelativePose.Position.y * 100.0f;
        output.camera[i].pose.orientation.x = extrinsics.RelativePose.Orientation.x;
        output.camera[i].pose.orientation.y = extrinsics.RelativePose.Orientation.y;
        output.camera[i].pose.orientation.z = extrinsics.RelativePose.Orientation.z;
        output.camera[i].pose.orientation.w = extrinsics.RelativePose.Orientation.w;
    }
    return output;
}

MRCResolution MRC_GetResolution()
{
    MRCResolution output = {};
    CHECK_MRC(ovrm_GetAPIs()->GetMrcFrameSize(&output.width, &output.height));
    return output;
}

void MRC_Update(double timestamp)
{
    int syncId;
    MRCResolution resolution = MRC_GetResolution();
    if (!MRC_Texture)
        MRC_Texture = new unsigned char[resolution.width * resolution.height * 4];
    glReadPixels(0, 0, resolution.width, resolution.height, GL_RGBA, GL_UNSIGNED_BYTE, MRC_Texture);

    CHECK_MRC(ovrm_GetAPIs()->EncodeMrcFrame(MRC_Texture, 0, 0, 0, timestamp, &syncId));
    CHECK_MRC(ovrm_GetAPIs()->SyncMrcFrame(syncId));
}
