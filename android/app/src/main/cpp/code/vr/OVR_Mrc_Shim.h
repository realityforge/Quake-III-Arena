/************************************************************************************
 @file      OVR_Mrc_Shim.h
 @brief     The shim interface to the Oculus Mixed Reality Capture library.
 @copyright Copyright (c) Facebook Technologies, LLC and its affiliates. All rights reserved.
 ************************************************************************************/

#pragma once

#include "OVR_Mrc_Types.h"

struct OVRM_API_STRUCTURE {
  typedef ovrmResult (*GetVersionsType)(int* majorVersion, int* minorVersion, int* patchVersion);
  GetVersionsType GetVersions;

  /// Initialize Oculus Mrc library
  typedef ovrmResult (*InitializeType)(void* nativeSDKPointer, void* javaVM, void* activityObject);
  InitializeType Initialize;

  /// Setup Mrc library in GLES mode
  typedef ovrmResult (*ConfigureGLESType)(void* eglContext, bool noErrorContext, bool srgbFrontBuffer);
  ConfigureGLESType ConfigureGLES;

  /// Setup Mrc library in Vulkan mode
  typedef ovrmResult (*ConfigureVulkanType)(void* vkInstance, void* vkPhysicalDevice, void* vkDevice, bool srgbFrontBuffer);
  ConfigureVulkanType ConfigureVulkan;

  /// Shutdown Oculus Mrc library
  typedef ovrmResult (*ShutdownType)();
  ShutdownType Shutdown;

  /// Return if Oculus Mrc library has been initialized
  typedef ovrmResult (*GetInitializedType)(ovrmBool* initialized);
  GetInitializedType GetInitialized;

  /// Tick per frame
  typedef ovrmResult (*UpdateType)();
  UpdateType Update;

  /// Get the current MRC activation mode
  typedef ovrmResult (*GetMrcActivationModeType)(ovrmMediaMrcActivationMode* activationMode);
  GetMrcActivationModeType GetMrcActivationMode;

  /// Set the current MRC activation mode
  typedef ovrmResult (*SetMrcActivationModeType)(ovrmMediaMrcActivationMode activationMode);
  SetMrcActivationModeType SetMrcActivationMode;

  /// Get if MRC is enabled
  typedef ovrmResult (*IsMrcEnabledType)(ovrmBool* mrcEnabled);
  IsMrcEnabledType IsMrcEnabled;

  /// Get if MRC is activated
  typedef ovrmResult (*IsMrcActivatedType)(ovrmBool* mrcActivated);
  IsMrcActivatedType IsMrcActivated;

  /// Get if requires a debug camera in MRC
  typedef ovrmResult (*UseMrcDebugCameraType)(ovrmBool* useMrcDebugCamera);
  UseMrcDebugCameraType UseMrcDebugCamera;

  /// Set the input video buffer type for encoding / streaming
  typedef ovrmResult (*SetMrcInputVideoBufferTypeType)(ovrmMediaInputVideoBufferType inputVideoBufferType);
  SetMrcInputVideoBufferTypeType SetMrcInputVideoBufferType;

  /// Get the input video buffer type for encoding / streaming
  typedef ovrmResult (*GetMrcInputVideoBufferTypeType)(ovrmMediaInputVideoBufferType* inputVideoBufferType);
  GetMrcInputVideoBufferTypeType GetMrcInputVideoBufferType;

  /// Set the target frame size for encoding / streaming
  typedef ovrmResult (*SetMrcFrameSizeType)(int frameWidth, int frameHeight);
  SetMrcFrameSizeType SetMrcFrameSize;

  /// Get the target frame size for encoding / streaming
  typedef ovrmResult (*GetMrcFrameSizeType)(int* frameWidth, int* frameHeight);
  GetMrcFrameSizeType GetMrcFrameSize;

  /// Set the audio sample rate for encoding / streaming
  typedef ovrmResult (*SetMrcAudioSampleRateType)(int sampleRate);
  SetMrcAudioSampleRateType SetMrcAudioSampleRate;

  /// Get the audio sample rate for encoding / streaming
  typedef ovrmResult (*GetMrcAudioSampleRateType)(int* sampleRate);
  GetMrcAudioSampleRateType GetMrcAudioSampleRate;

  /// Set if the video frame is flipped vertically
  typedef ovrmResult (*SetMrcFrameImageFlippedType)(ovrmBool flipped);
  SetMrcFrameImageFlippedType SetMrcFrameImageFlipped;

  /// Get if the video frame is flipped vertically
  typedef ovrmResult (*GetMrcFrameImageFlippedType)(ovrmBool* flipped);
  GetMrcFrameImageFlippedType GetMrcFrameImageFlipped;

  /// Set if the video frame has inverse alpha
  typedef ovrmResult (*SetMrcFrameInverseAlphaType)(ovrmBool inverseAlpha);
  SetMrcFrameInverseAlphaType SetMrcFrameInverseAlpha;

  /// Get if the video frame has inverse alpha
  typedef ovrmResult (*GetMrcFrameInverseAlphaType)(ovrmBool* inverseAlpha);
  GetMrcFrameInverseAlphaType GetMrcFrameInverseAlpha;

  /// Get if the queue index for Vulkan
  typedef ovrmResult (*SetAvailableQueueIndexVulkanType)(unsigned int queueIndexVk);
  SetAvailableQueueIndexVulkanType SetAvailableQueueIndexVulkan;

  /// Send a/v frame for encoding / streaming (raw memory bytes, or texture handle)
  typedef ovrmResult (*EncodeMrcFrameType)(void* videoData, float* audioData, int audioDataLen, int audioChannels, double timestamp, int* outSyncId);
  EncodeMrcFrameType EncodeMrcFrame;

  /// Send a/v frame for encoding / streaming (texture handle)
  typedef ovrmResult (*EncodeMrcFrameWithDualTexturesType)(void* backgroundTextureHandle, void* foregroundTextureHandle, float* audioData, int audioDataLen, int audioChannels, double timestamp, int* outSyncId);
  EncodeMrcFrameWithDualTexturesType EncodeMrcFrameWithDualTextures;

  /// Wait until the last a/v frame get sent out
  typedef ovrmResult (*SyncMrcFrameType)(int syncId);
  SyncMrcFrameType SyncMrcFrame;

  /// Get the number of external cameras
  typedef ovrmResult (*GetExternalCameraCountType)(int* cameraCount);
  GetExternalCameraCountType GetExternalCameraCount;

  /// Get the name of an external camera
  typedef ovrmResult (*GetExternalCameraNameType)(int cameraId, char cameraName[OVRM_EXTERNAL_CAMERA_NAME_SIZE]);
  GetExternalCameraNameType GetExternalCameraName;

  /// Get intrinsics of an external camera
  typedef ovrmResult (*GetExternalCameraIntrinsicsType)(int cameraId, ovrmCameraIntrinsics* cameraIntrinsics);
  GetExternalCameraIntrinsicsType GetExternalCameraIntrinsics;

  /// Get extrinsics of an external camera
  typedef ovrmResult (*GetExternalCameraExtrinsicsType)(int cameraId, ovrmCameraExtrinsics* cameraExtrinsics);
  GetExternalCameraExtrinsicsType GetExternalCameraExtrinsics;

  /// Get the raw transform pose when the external camera was calibrated
  typedef ovrmResult (*GetExternalCameraCalibrationRawPoseType)(int cameraId, ovrmPosef* rawPose);
  GetExternalCameraCalibrationRawPoseType GetExternalCameraCalibrationRawPose;

  /// Override the FOV of the external camera
  typedef ovrmResult (*OverrideExternalCameraFovType)(int cameraId, ovrmBool useOverriddenFov, const ovrmFovf* fov);
  OverrideExternalCameraFovType OverrideExternalCameraFov;

  /// Get if the FOV of the external camera is overridden
  typedef ovrmResult (*GetUseOverriddenExternalCameraFovType)(int cameraId, ovrmBool* useOverriddenFov);
  GetUseOverriddenExternalCameraFovType GetUseOverriddenExternalCameraFov;

  /// Override the Pose of the external camera
  typedef ovrmResult (*OverrideExternalCameraStaticPoseType)(int cameraId, ovrmBool useOverriddenPose, const ovrmPosef* pose);
  OverrideExternalCameraStaticPoseType OverrideExternalCameraStaticPose;

  /// Get if the Pose of the external camera is overridden
  typedef ovrmResult (*GetUseOverriddenExternalCameraStaticPoseType)(int cameraId, ovrmBool* useOverriddenStaticPose);
  GetUseOverriddenExternalCameraStaticPoseType GetUseOverriddenExternalCameraStaticPose;

  /// Helper function to get the camera pose in the tracking space
  typedef ovrmResult (*GetExternalCameraPoseType)(int cameraId, ovrmPosef* cameraPose);
  GetExternalCameraPoseType GetExternalCameraPose;

  /// Helper function to get convert a pose in tracking space to camera space
  typedef ovrmResult (*ConvertPoseToCameraSpaceType)(int cameraId, ovrmPosef* trackingSpacePose, ovrmPosef* cameraSpacePose);
  ConvertPoseToCameraSpaceType ConvertPoseToCameraSpace;

  /// Reset the manual external camera
  typedef ovrmResult (*ResetDefaultExternalCameraType)();
  ResetDefaultExternalCameraType ResetDefaultExternalCamera;

  /// Add a new extra camera to the external camera array
  typedef ovrmResult (*SetDefaultExternalCameraType)(const char* cameraName, const ovrmCameraIntrinsics* cameraIntrinsics, const ovrmCameraExtrinsics* cameraExtrinsics);
  SetDefaultExternalCameraType SetDefaultExternalCamera;
};

extern bool ovrm_LoadSharedLibrary(const char* nativeLibraryDir);
extern void ovrm_UnloadSharedLibrary();

extern OVRM_API_STRUCTURE* ovrm_GetAPIs();
