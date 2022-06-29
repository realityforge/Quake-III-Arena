/************************************************************************************
 @file      OVR_Mrc_Shim.cpp
 @brief     The shim loader to the Oculus Mixed Reality Capture library.
 @copyright Copyright (c) Facebook Technologies, LLC and its affiliates. All rights reserved.
 ************************************************************************************/

#include "OVR_Mrc_Shim.h"
#include <string>
#include <dlfcn.h>
#include <memory.h>
#include <android/log.h>

#define OVRMRC_LOGTAG "OVRMrcLib"

void* s_libraryHandle = nullptr;
OVRM_API_STRUCTURE s_API = { 0 };

#define OVRM_LOAD_API_ITEM(Function)                                                                    \
    s_API.Function = (OVRM_API_STRUCTURE::Function##Type)dlsym(s_libraryHandle, "ovrm_" #Function);     \
    if (!s_API.Function) {                                                                              \
        __android_log_print(ANDROID_LOG_ERROR, OVRMRC_LOGTAG, "Function %s failed to load", #Function); \
        dlclose(s_libraryHandle);                                                                       \
        s_libraryHandle = nullptr;                                                                      \
        return false;                                                                                   \
    } else {                                                                                            \
        __android_log_print(ANDROID_LOG_DEBUG, OVRMRC_LOGTAG, "Function %s loaded", #Function);         \
    }

bool ovrm_LoadSharedLibrary(const char* nativeLibraryDir)
{
#ifndef __ANDROID__
    return false;
#else
    if (s_libraryHandle) {
        __android_log_print(ANDROID_LOG_DEBUG, OVRMRC_LOGTAG, "s_libraryHandle already loaded");
        return true;
    }

    if (nativeLibraryDir != nullptr) {
        std::string libraryDir;

        libraryDir = std::string(nativeLibraryDir) + "/libOVRMrcLib.oculus.so";
        __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "Try loading %s", libraryDir.c_str());
        s_libraryHandle = dlopen(libraryDir.c_str(), RTLD_NOW);

        if (!s_libraryHandle) {
            libraryDir = std::string(nativeLibraryDir) + "/libOVRMrcLib.so";
            __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "Try loading %s", libraryDir.c_str());
            s_libraryHandle = dlopen(libraryDir.c_str(), RTLD_NOW);
        }
    }

    if (!s_libraryHandle) {
        __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "Try loading libOVRMrcLib.oculus.so");
        s_libraryHandle = dlopen("libOVRMrcLib.oculus.so", RTLD_NOW);
    }

    if (!s_libraryHandle) {
        __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "Try loading libOVRMrcLib.so");
        s_libraryHandle = dlopen("libOVRMrcLib.so", RTLD_NOW);
    }

    if (!s_libraryHandle) {
        __android_log_print(ANDROID_LOG_ERROR, OVRMRC_LOGTAG, "Unable to load OVRMrcLib");
        return false;
    } else {
        __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "OVRMrcLib loaded successfully");
    }

    memset(&s_API, 0, sizeof(s_API));

    OVRM_LOAD_API_ITEM(GetVersions);

    int majorVersion = 0;
    int minorVersion = 0;
    int patchVersion = 0;
    s_API.GetVersions(&majorVersion, &minorVersion, &patchVersion);

    __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "libOVRMrcLib.so version: %d.%d.%d", majorVersion, minorVersion, patchVersion);

    OVRM_LOAD_API_ITEM(Initialize);
    OVRM_LOAD_API_ITEM(ConfigureGLES);
    OVRM_LOAD_API_ITEM(ConfigureVulkan);
    OVRM_LOAD_API_ITEM(Shutdown);
    OVRM_LOAD_API_ITEM(GetInitialized);
    OVRM_LOAD_API_ITEM(Update);
    OVRM_LOAD_API_ITEM(GetMrcActivationMode);
    OVRM_LOAD_API_ITEM(SetMrcActivationMode);
    OVRM_LOAD_API_ITEM(IsMrcEnabled);
    OVRM_LOAD_API_ITEM(IsMrcActivated);
    OVRM_LOAD_API_ITEM(UseMrcDebugCamera);
    OVRM_LOAD_API_ITEM(SetMrcInputVideoBufferType);
    OVRM_LOAD_API_ITEM(GetMrcInputVideoBufferType);
    OVRM_LOAD_API_ITEM(SetMrcFrameSize);
    OVRM_LOAD_API_ITEM(GetMrcFrameSize);
    OVRM_LOAD_API_ITEM(SetMrcAudioSampleRate);
    OVRM_LOAD_API_ITEM(GetMrcAudioSampleRate);
    OVRM_LOAD_API_ITEM(SetMrcFrameImageFlipped);
    OVRM_LOAD_API_ITEM(GetMrcFrameImageFlipped);
    OVRM_LOAD_API_ITEM(SetMrcFrameInverseAlpha);
    OVRM_LOAD_API_ITEM(GetMrcFrameInverseAlpha);
    OVRM_LOAD_API_ITEM(SetAvailableQueueIndexVulkan);
    OVRM_LOAD_API_ITEM(EncodeMrcFrame);
    OVRM_LOAD_API_ITEM(EncodeMrcFrameWithDualTextures);
    OVRM_LOAD_API_ITEM(SyncMrcFrame);
    OVRM_LOAD_API_ITEM(GetExternalCameraCount);
    OVRM_LOAD_API_ITEM(GetExternalCameraName);
    OVRM_LOAD_API_ITEM(GetExternalCameraIntrinsics);
    OVRM_LOAD_API_ITEM(GetExternalCameraExtrinsics);
    OVRM_LOAD_API_ITEM(GetExternalCameraCalibrationRawPose);
    OVRM_LOAD_API_ITEM(OverrideExternalCameraFov);
    OVRM_LOAD_API_ITEM(GetUseOverriddenExternalCameraFov);
    OVRM_LOAD_API_ITEM(OverrideExternalCameraStaticPose);
    OVRM_LOAD_API_ITEM(GetUseOverriddenExternalCameraStaticPose);
    OVRM_LOAD_API_ITEM(GetExternalCameraPose);
    OVRM_LOAD_API_ITEM(ConvertPoseToCameraSpace);
    OVRM_LOAD_API_ITEM(ResetDefaultExternalCamera);
    OVRM_LOAD_API_ITEM(SetDefaultExternalCamera);

    Dl_info dl_info;
    dladdr((void*)s_API.GetVersions, &dl_info);
    __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "ovrm_LoadSharedLibrary() succeeded. Module loaded from %s", dl_info.dli_fname);

    return true;
#endif
}

#undef OVRM_LOAD_API_ITEM

void ovrm_UnloadSharedLibrary()
{
#ifdef __ANDROID__
    if (s_libraryHandle) {
        dlclose(s_libraryHandle);
        s_libraryHandle = nullptr;
        memset(&s_API, 0, sizeof(s_API));
        __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "s_libraryHandle closed");
    }
    __android_log_print(ANDROID_LOG_INFO, OVRMRC_LOGTAG, "ovrm_UnloadSharedLibrary() succeeded");
#endif
}

OVRM_API_STRUCTURE* ovrm_GetAPIs()
{
#ifndef __ANDROID__
    return nullptr;
#else
    if (s_libraryHandle) {
        return &s_API;
    } else {
        return nullptr;
    }
#endif
}
