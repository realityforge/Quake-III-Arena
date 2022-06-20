/** 
 * @mainpage OVRMrcLib
 *
 * @section intro_sec Introduction
 *
 * OVRMrcLib is a library which supports Mixed Reality Capture on Oculus Quest.
 * 
 * The library provides:
 *   1. load an existing camera configuration, so application can obtain the intrinsics and extrinsics information, and construct the virtual camera(s) which matches the physical camera
 *   2. encoding and streaming the output of the virtual camera(s) through WIFI
 * 
 * Please check https://developer.oculus.com/documentation/mrc/mr-intro/ for detailed information about Mixed Reality Capture
 *
 * @section integration_sec Integration
 * 
 * The interfaces in OVR_Mrc.h is only a development reference and shouldn't be called directly. 
 * 
 * To integrate OVRMrcLib to your project:
 *   1. Including Shim/OVR_Mrc_Shim.h and Shim/OVR_Mrc_Shim.cpp
 *   2. call ovrm_LoadSharedLibrary()
 *   3. Call ovrm_GetAPIs().Func() to access individual functions
 *   4. call ovrm_UnloadSharedLibrary() when quitting application
 * 
 * Here is a brief summary of the MRC workflow. Please investigate our Unity / UE4 integration code to get futher details.
 *
 * @subsection initialization_subsec Initialization
 * 
 *   1. (initialize the Oculus Mobile SDK)
 *   2. ovrm_Initialize()
 *   3. // setup graphics APIs
 *     1. ovrm_ConfigureGLES() // if GLES
 *     2. ovrm_ConfigureVulkan(), ovrm_SetAvailableQueueIndexVulkan() // if Vulkan
 *   4. ovrm_SetMrcActivationMode()
 *   5. ovrm_SetMrcInputVideoBufferType(), ovrm_SetMrcAudioSampleRate()
 * 
 * @subsection gameloop_subsec Game loop
 * 
 *   1. ovrm_Update()
 *   2. ovrm_GetMrcActivationMode()
 *   3. if MRC is activated ...
 *     1. ovrm_GetExternalCameraCount() / ovrm_GetExternalCameraIntrinsics() / ovrm_GetExternalCameraExtrinsics()
 *     2. construct or update virtual cameras (foreground and background camera)
 *     3. render to the virtual cameras
 *       - you can interleaving the rendering of foreground and background camera for optimal performance
 *     4. for every other frame ...
 *       1. call ovrm_SyncMrcFrame() with the syncId from the last ovrm_EncodeXXX()
 *       1. call ovrm_EncodeMrcFrame() or ovrm_EncodeMrcFrameWithDualTextures() to submit the RenderTexture handle from the virtual camera
 * 
 * @subsection cleanup Cleanup
 * 
 *   1. ovrm_Shutdown()
 */

/**
 * @file      OVR_Mrc.h
 * @brief     C Interface to the Oculus Mixed Reality Capture library.
 * @copyright Copyright (c) Facebook Technologies, LLC and its affiliates. All rights reserved.
 */

#ifndef OVR_Mrc_h
#define OVR_Mrc_h

#include "OVR_Mrc_Types.h"

#ifdef __cplusplus
extern "C" {
#endif

/** 
 * Get the verison of Oculus Mrc library
 * @param majorVersion pointer to store the major version
 * @param minorVersion pointer to store the minor version
 * @param patchVersion pointer to store the patch version
 */
OVRM_EXPORT ovrmResult ovrm_GetVersions(int* majorVersion, int* minorVersion, int* patchVersion);

/** 
 * Initialize Oculus Mrc library
 * @param nativeSDKPointer VR session pointer. e.g. ovrMobile*
 * @param javaVM JavaVM. Must be passed through JNI_OnLoad() if nullptr is specified
 * @param activityObject Android activity object
 */
OVRM_EXPORT ovrmResult ovrm_Initialize(void* nativeSDKPointer, void* javaVM, void* activityObject);

/** 
 * Configure Mrc library in GLES mode
 * @param eglContent The EGLContext which will be used in app rendering. OVRMrcLib will create a shared context based on it
 * @param noErrorContext Ture if the eglContext was created with EGL_CONTEXT_OPENGL_NO_ERROR_KHR
 * @param srgbFrontBuffer True if the texture to be encoded would be in SRGB format 
 */
OVRM_EXPORT ovrmResult ovrm_ConfigureGLES(void* eglContext, bool noErrorContext, bool srgbFrontBuffer);

/** 
 * Configure Mrc library in Vulkan mode
 * @param vkInstance handle to the Vulkan instance object
 * @param vkPhysicalInstance handle to the Vulkan physical instance object
 * @param vkDevice handle to the Vulkan device
 * @param srgbFrontBuffer True if the texture to be encoded would be in SRGB format
 */
OVRM_EXPORT ovrmResult ovrm_ConfigureVulkan(void* vkInstance, void* vkPhysicalDevice, void* vkDevice, bool srgbFrontBuffer);

/**
 * Set the queue index which MRC should use in Vulkan.
 * When creating the VkDevice, it's important to set queueCount in VkDeviceQueueCreateInfo to obtain an extra Queue which application won't submit to. This extra Queue would be reserved for MRC.
 * @param queueIndexVk the index of the reserved Queue
 */
OVRM_EXPORT ovrmResult ovrm_SetAvailableQueueIndexVulkan(unsigned int queueIndexVk);

/** 
 * Shutdown Oculus Mrc library
 */
OVRM_EXPORT ovrmResult ovrm_Shutdown();

/**
 * Return if Oculus Mrc library has been initialized
 * @param initialized store if the library has been initialized
 */
OVRM_EXPORT ovrmResult ovrm_GetInitialized(ovrmBool* initialized);

/**
 * Updating the OVRMrcLib. Should be called from game update
 */
OVRM_EXPORT ovrmResult ovrm_Update();

/**
 * Get the current MRC activation mode
 * @param activationMode store the current activation mode
 */
OVRM_EXPORT ovrmResult ovrm_GetMrcActivationMode(ovrmMediaMrcActivationMode* activationMode);

/**
 * Set the current MRC activation mode
 * @param activationMode the activation mode to set
 */
OVRM_EXPORT ovrmResult ovrm_SetMrcActivationMode(ovrmMediaMrcActivationMode activationMode);

/**
 * Get if MRC is enabled. It means a client would have the ability to connect to the running Quest app and activate MRC
 * @param mrcEnabled store the enabled status
 */
OVRM_EXPORT ovrmResult ovrm_IsMrcEnabled(ovrmBool* mrcEnabled);

/**
 * Get if MRC is activated, which means the Quest app should construct the 3rd person camera and call 
 * ovrm_EncodeMrcFrame/ovrm_EncodeMrcFrameWithDualTextures with a frequency around 30Hz
 * @param mrcActivated store the activated status
 */
OVRM_EXPORT ovrmResult ovrm_IsMrcActivated(ovrmBool* mrcActivated);

/**
 * Get if user requires to generate a debug camera (when testing MRC)
 * @param useMrcDebugCamera True if "debug.oculus.mrc.debugcamera" sysprop is set to 1
 */
OVRM_EXPORT ovrmResult ovrm_UseMrcDebugCamera(ovrmBool* useMrcDebugCamera);

/** 
 * Set the input video buffer type for encoding / streaming
 * @param inputVideoBufferType the input buffer type. only ovrmMediaInputVideoBufferType_TextureHandle is supported
 */
OVRM_EXPORT ovrmResult ovrm_SetMrcInputVideoBufferType(ovrmMediaInputVideoBufferType inputVideoBufferType);

/** 
 * Get the input video buffer type for encoding / streaming
 * @param inputVideoBufferType store the current input buffer type
 */
OVRM_EXPORT ovrmResult ovrm_GetMrcInputVideoBufferType(ovrmMediaInputVideoBufferType* inputVideoBufferType);

/** 
 * Set the target frame size for encoding / streaming. 
 * It's the dimension of the texture which the game would submit for encoding. 
 * If app need a different frame size other than default, it need to call this function before connecting to a client. 
 * @param frameWidth width of the video frame
 * @param frameHeight height of the video frame
 */
OVRM_EXPORT ovrmResult ovrm_SetMrcFrameSize(int frameWidth, int frameHeight);

/**
 * Get the target frame size for encoding / streaming.
 * Game should allocate the render target matches the size of MRC frame. 
 * @param frameWidth store the width of the video frame
 * @param frameHeight store the height of the video frame
 */
OVRM_EXPORT ovrmResult ovrm_GetMrcFrameSize(int* frameWidth, int* frameHeight);

/**
 * Set the audio sample rate for encoding / streaming
 * Game should call this function after initialization to setup the audio sample rate
 * @param sampleRate the audio sample rate (in Hz)
 */
OVRM_EXPORT ovrmResult ovrm_SetMrcAudioSampleRate(int sampleRate);

/**
 * Get the audio sample rate for encoding / streaming
 * @param sampleRate store the current audio sample rate (in Hz)
 */
OVRM_EXPORT ovrmResult ovrm_GetMrcAudioSampleRate(int* sampleRate);

/**
 * Set if the MRC encoder should flipped the video frame vertically
 * @param flipped flip the video frame vertically
 */
OVRM_EXPORT ovrmResult ovrm_SetMrcFrameImageFlipped(ovrmBool flipped);

/**
 * Get if the video frame is currently flipped vertically
 * @param flipped store if the vido frame is flipped vertically
 */
OVRM_EXPORT ovrmResult ovrm_GetMrcFrameImageFlipped(ovrmBool* flipped);

/**
 * Set if the video frame has inverse alpha (1 = fully transparency, 0 = opaque)
 * @param inverseAlpha if the inverse alpha is used
 */
OVRM_EXPORT ovrmResult ovrm_SetMrcFrameInverseAlpha(ovrmBool inverseAlpha);

/**
 * Get if the video frame has inverse alpha
 * @param inverseAlpha store if the inverse alpha is currently used
 */
OVRM_EXPORT ovrmResult ovrm_GetMrcFrameInverseAlpha(ovrmBool* inverseAlpha);

/**
 * Send a/v frame for encoding / streaming
 * @param videoData the video frame (as texture handle)
 * @param audioData the audio buffer
 * @param audioDataLen the length of the audio buffer (in bytes)
 * @param audioChannels number of audio channels, must be 2
 * @param timestamp the timestamp of this frame
 * @param outSyncId return the syndId to be used in ovrm_SyncMrcFrame()
 */
OVRM_EXPORT ovrmResult ovrm_EncodeMrcFrame(void* videoData, float* audioData, int audioDataLen, int audioChannels, double timestamp, int* outSyncId);

/**
 * Send a/v frame for encoding / streaming (separate background and foreground textures)
 * @param backgroundTextureHandle the background texture
 * @param foregroundTextureHandle the foreground texture
 * @param audioData the audio buffer
 * @param audioDataLen the length of the audio buffer (in bytes)
 * @param audioChannels number of audio channels, must be 2
 * @param timestamp the timestamp of this frame
 * @param outSyncId return the syndId to be used in ovrm_SyncMrcFrame()
 */
OVRM_EXPORT ovrmResult ovrm_EncodeMrcFrameWithDualTextures(void* backgroundTextureHandle, void* foregroundTextureHandle, float* audioData, int audioDataLen, int audioChannels, double timestamp, int* outSyncId);

/**
 * Wait until the last a/v frame get sent out
 * @param syncId the syncId obtained from ovrm_EncodeXXX() functions
 */
OVRM_EXPORT ovrmResult ovrm_SyncMrcFrame(int syncId);

/**
 * Get the number of external cameras
 * @param cameraCount store the number of external cameras
 */
OVRM_EXPORT ovrmResult ovrm_GetExternalCameraCount(int* cameraCount);

/**
 * Get the name of an external camera
 * @param cameraId camera id
 * @param cameraName camera name
 */
OVRM_EXPORT ovrmResult ovrm_GetExternalCameraName(int cameraId, char cameraName[OVRM_EXTERNAL_CAMERA_NAME_SIZE]);

/**
 * Get intrinsics of an external camera
 * @param cameraId camera id
 * @param cameraIntrinsics store the intrinsics of the camera
 */
OVRM_EXPORT ovrmResult ovrm_GetExternalCameraIntrinsics(int cameraId, ovrmCameraIntrinsics* cameraIntrinsics);

/**
 * Get extrinsics of an external camera
 * @param cameraId camera id
 * @param cameraExtrinsics store the extrinsics of the camera
 */
OVRM_EXPORT ovrmResult ovrm_GetExternalCameraExtrinsics(int cameraId, ovrmCameraExtrinsics* cameraExtrinsics);

/**
 * Get the raw transform pose when the external camera was calibrated (DEPRECATED)
 * @param cameraId camera id
 * @param rawPose returns an identity pose
 */
OVRM_EXPORT ovrmResult ovrm_GetExternalCameraCalibrationRawPose(int cameraId, ovrmPosef* rawPose);

/**
 * Override the FOV of the external camera
 * @param cameraId camera id
 * @param useOverriddenFov if the camera FOV should be overridden
 * @param fov the overridden FOV, or nullptr if useOverriddenFov is false
 */
OVRM_EXPORT ovrmResult ovrm_OverrideExternalCameraFov(int cameraId, ovrmBool useOverriddenFov, const ovrmFovf* fov);

/**
 * Get if the FOV of the external camera is overridden
 * @param cameraId camera id
 * @param useOverriddenFov if the camera FOV is overridden
 */
OVRM_EXPORT ovrmResult ovrm_GetUseOverriddenExternalCameraFov(int cameraId, ovrmBool* useOverriddenFov);

/**
 * Override the Pose of the external camera. The pose should be located at the Stage tracking space
 * @param cameraId camera id
 * @param useOverriddenPose if the camera FOV should be overridden
 * @param pose the overridden pose in the current tracking space, or nullptr if useOverriddenFov is false.
 */
OVRM_EXPORT ovrmResult ovrm_OverrideExternalCameraStaticPose(int cameraId, ovrmBool useOverriddenPose, const ovrmPosef* pose);

/**
 * Get if the Pose of the external camera is overridden
 * @param cameraId camera id
 * @param useOverriddenPose if the camera pose is overridden
 */
OVRM_EXPORT ovrmResult ovrm_GetUseOverriddenExternalCameraStaticPose(int cameraId, ovrmBool* useOverriddenStaticPose);

/**
 * [deprecated] Helper function to get the camera pose in the tracking space when it was calibrated
 * @param cameraId camera id
 * @param cameraPose store the camera pose in tracking space
 */
OVRM_EXPORT ovrmResult ovrm_GetExternalCameraPose(int cameraId, ovrmPosef* cameraPose);

/**
 * [deprecated] Helper function to convert a pose in tracking space to a pose relative to the camera
 * @param cameraId camera id
 * @param trackingSpacePose the tracking space pose
 * @param cameraSpacePose store the converted pose in the camera space
 */
OVRM_EXPORT ovrmResult ovrm_ConvertPoseToCameraSpace(int cameraId, ovrmPosef* trackingSpacePose, ovrmPosef* cameraSpacePose);

/**
 * Reset the default external camera
 * It would stop listenting to the MRC port if needed
 */
OVRM_EXPORT ovrmResult ovrm_ResetDefaultExternalCamera();

/**
 * Set a default external camera to the system. The default external camera would be used when there is no camera configuration can be loaded
 * It would start listenting to the MRC port if needed
 * @param cameraName            the name of the camera
 * @param cameraIntrinsics      intrinsics of the camera
 * @param cameraExtrinsics      extrinsics of the camera (the pose is relative to the current tracking space)
 */
OVRM_EXPORT ovrmResult ovrm_SetDefaultExternalCamera(const char* cameraName, const ovrmCameraIntrinsics* cameraIntrinsics, const ovrmCameraExtrinsics* cameraExtrinsics);

#ifdef __cplusplus
}
#endif

#endif
