/************************************************************************************

Copyright (c) Facebook Technologies, LLC and its affiliates.  All rights reserved.

Licensed under the Oculus SDK License Version 3.5 (the "License");
you may not use the Oculus SDK except in compliance with the License,
which is provided at the time of installation or download, or which
otherwise accompanies this software in either electronic or hard copy form.

You may obtain a copy of the License at

https://developer.oculus.com/licenses/sdk-3.5/

Unless required by applicable law or agreed to in writing, the Oculus SDK
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

************************************************************************************/

#include <stdint.h>

#ifndef OVR_Mrc_Types_h
#define OVR_Mrc_Types_h

#if !defined(OVRM_STRINGIFY)
#define OVRM_STRINGIFYIMPL(x) #x
#define OVRM_STRINGIFY(x) OVRM_STRINGIFYIMPL(x)
#endif

#define OVRM_MAJOR_VERSION 1
#define OVRM_MINOR_VERSION 48
#define OVRM_PATCH_VERSION 0

#define OVRM_VERSION OVRM_MAJOR_VERSION, OVRM_MINOR_VERSION, OVRM_PATCH_VERSION
#define OVRM_VERSION_STR OVRM_STRINGIFY(OVRM_MAJOR_VERSION.OVRM_MINOR_VERSION.OVRM_PATCH_VERSION)

#ifdef OVR_INTERNAL_CODE
#define OVRM_VERSION_CHANNEL "Internal"
#else
#define OVRM_VERSION_CHANNEL "Release"
#endif

#ifndef OVRM_EXPORT
#ifdef _WIN32
#define OVRM_EXPORT __declspec(dllexport)
#elif __ANDROID__
#define OVRM_EXPORT __attribute__((visibility("default")))
#else
#define OVRM_EXPORT
#endif
#endif

#if defined ANDROID || defined __linux__
#define __cdecl
#endif

#ifdef __cplusplus
#define OVRM_REF(Type) Type&
#define OVRM_CONSTREF(Type) const Type&
#define OVRM_DEFAULTVALUE(Value) = Value
#else
#define OVRM_REF(Type) Type*
#define OVRM_CONSTREF(Type) const Type*
#define OVRM_DEFAULTVALUE(Value)
#endif

/// True or false
enum {
    ovrmBool_False = 0,
    ovrmBool_True = 1,
};
typedef int ovrmBool;

/// Byte
typedef unsigned char ovrmByte;

/// UInt16
typedef unsigned short ovrmUInt16;

/// Int64
typedef long long ovrmInt64;

/// Success and failure
typedef enum {
    /// Success
    ovrmSuccess = 0,

    /// Failure
    ovrmFailure = -1000,
    ovrmFailure_InvalidParameter = -1001,
    ovrmFailure_NotInitialized = -1002,
    ovrmFailure_InvalidOperation = -1003,
    ovrmFailure_Unsupported = -1004,
    ovrmFailure_NotYetImplemented = -1005,
    ovrmFailure_OperationFailed = -1006,
    ovrmFailure_InsufficientSize = -1007,
    ovrmFailure_DataIsInvalid = -1008,
} ovrmResult;

#define OVRM_SUCCESS(result) ((result) >= 0)
#define OVRM_FAILURE(result) ((result) < 0)

/// Logging levels
typedef enum {
    ovrmLogLevel_Debug = 0,
    ovrmLogLevel_Info = 1,
    ovrmLogLevel_Error = 2,
    ovrmLogLevel_EnumSize = 0x7fffffff
} ovrmLogLevel;

/// Control the activation of mixed reality capture
typedef enum {
    ovrmMediaMrcActivationMode_Automatic = 0,
    ovrmMediaMrcActivationMode_Disabled = 1,
    ovrmMediaMrcActivationMode_EnumSize = 0x7fffffff
} ovrmMediaMrcActivationMode;

/// Media encoder input buffer types
typedef enum {
    /// raw memory. pixel format in RGBA
    ovrmMediaInputVideoBufferType_Memory = 0,
    /// texture handle (e.g. texId if GLES)
    ovrmMediaInputVideoBufferType_TextureHandle = 1,
    ovrmMediaInputVideoBufferType_EnumSize = 0x7fffffff
} ovrmMediaInputVideoBufferType;

#if defined(__arm__)
typedef void (*ovrmLogCallback)(ovrmLogLevel, const char*);
#else
typedef void(__cdecl* ovrmLogCallback)(ovrmLogLevel, const char*);
#endif

typedef struct {
    int MajorVersion;
    int MinorVersion;
    int PatchVersion;
} ovrmVersion;

/// A RGBA color with 8-bit unsigned integer components
typedef struct {
    uint8_t r, g, b, a;
} ovrmColor;

/// A 2D size with integer components.
typedef struct {
    int w, h;
} ovrmSizei;

/// A 2D size with float components.
typedef struct {
    float w, h;
} ovrmSizef;

/// A 2D vector with integer components.
typedef struct {
    int x, y;
} ovrmVector2i;

/// A 2D vector with float components.
typedef struct {
    float x, y;
} ovrmVector2f;

/// A 3D vector with float components.
typedef struct {
    float x, y, z;
} ovrmVector3f;

/// A 4D vector with float components.
typedef struct {
    float x, y, z, w;
} ovrmVector4f;

/// A quaternion rotation.
typedef struct {
    float x, y, z, w;
} ovrmQuatf;

/// Row-major 3x3 matrix.
typedef struct {
    float M[3][3];
} ovrmMatrix3f;

/// Row-major 4x4 matrix.
typedef struct {
    float M[4][4];
} ovrmMatrix4f;

/// Position and orientation together.
typedef struct {
    ovrmQuatf Orientation;
    ovrmVector3f Position;
} ovrmPosef;

/// Position and orientation together.
typedef struct {
    ovrmPosef Pose;
    ovrmVector3f Velocity;
    ovrmVector3f Acceleration;
    ovrmVector3f AngularVelocity;
    ovrmVector3f AngularAcceleration;
    double Time;
} ovrmPoseStatef;

/// Asymmetric fov port
typedef struct {
    float UpTan;
    float DownTan;
    float LeftTan;
    float RightTan;
} ovrmFovf;

/// Asymmetric frustum for a camera.
typedef struct {
    /// Near clip plane.
    float zNear;
    /// Far clip plane.
    float zFar;
    ovrmFovf Fov;
} ovrmFrustum2f;

/// A 2D rectangle with a position and size as integers.
typedef struct {
    ovrmVector2i Pos;
    ovrmSizei Size;
} ovrmRecti;

/// A 2D rectangle with a position and size as floats.
typedef struct {
    ovrmVector2f Pos;
    ovrmSizef Size;
} ovrmRectf;

typedef struct {
    float r, g, b, a;
} ovrmColorf;

/// Identifies a tracked VR Node.
typedef enum {
    ovrmNode_None = -1,
    ovrmNode_EyeLeft = 0,
    ovrmNode_EyeRight = 1,
    ovrmNode_EyeCenter = 2,
    ovrmNode_HandLeft = 3,
    ovrmNode_HandRight = 4,
    ovrmNode_TrackerZero = 5,
    ovrmNode_TrackerOne = 6,
    ovrmNode_TrackerTwo = 7,
    ovrmNode_TrackerThree = 8,
    ovrmNode_Head = 9,
    ovrmNode_DeviceObjectZero = 10,
    ovrmNode_Count,
    ovrmNode_EnumSize = 0x7fffffff
} ovrmNode;

/// Camera status
typedef enum {
    ovrmCameraStatus_None,
    ovrmCameraStatus_Connected,
    ovrmCameraStatus_Calibrating,
    ovrmCameraStatus_CalibrationFailed,
    ovrmCameraStatus_Calibrated,
    ovrmCameraStatus_EnumSize = 0x7fffffff
} ovrmCameraStatus;

/// Camera intrinsics
typedef struct {
    ovrmBool IsValid;
    double LastChangedTimeSeconds;
    ovrmFovf FOVPort;
    float VirtualNearPlaneDistanceMeters;
    float VirtualFarPlaneDistanceMeters;
    ovrmSizei ImageSensorPixelResolution;
} ovrmCameraIntrinsics;

/// Camera extrinsics
typedef struct {
    ovrmBool IsValid;
    double LastChangedTimeSeconds;
    ovrmCameraStatus CameraStatus;
    ovrmNode AttachedToNode;
    ovrmPosef RelativePose;
} ovrmCameraExtrinsics;

#define OVRM_EXTERNAL_CAMERA_NAME_SIZE 32

typedef struct {
    float fx; /* Focal length in pixels along x axis. */
    float fy; /* Focal length in pixels along y axis. */
    float cx; /* Optical center along x axis, defined in pixels (usually close to width/2). */
    float cy; /* Optical center along y axis, defined in pixels (usually close to height/2). */
    double disto[5]; /* Distortion factor : [ k1, k2, p1, p2, k3 ]. Radial (k1,k2,k3) and Tangential (p1,p2) distortion.*/
    float v_fov; /* Vertical field of view after stereo rectification, in degrees. */
    float h_fov; /* Horizontal field of view after stereo rectification, in degrees.*/
    float d_fov; /* Diagonal field of view after stereo rectification, in degrees.*/
    int w; /* Resolution width */
    int h; /* Resolution height */
} ovrmCameraDeviceIntrinsicsParameters;

/// A texture format.
typedef enum {
    ovrmTextureFormat_R8G8B8A8_sRGB = 0,
    ovrmTextureFormat_R8G8B8A8 = 1,
    ovrmTextureFormat_R16G16B16A16_FP = 2,
    ovrmTextureFormat_R11G11B10_FP = 3,
    ovrmTextureFormat_B8G8R8A8_sRGB = 4,
    ovrmTextureFormat_B8G8R8A8 = 5,
    ovrmTextureFormat_R5G6B5 = 11,

    // depth texture formats
    ovrmTextureFormat_D16 = 6,
    ovrmTextureFormat_D24_S8 = 7,
    ovrmTextureFormat_D32_FP = 8,
    ovrmTextureFormat_D32_S824_FP = 9,

    ovrmTextureFormat_None = 10,

    ovrmTextureFormat_EnumSize = 0x7fffffff
} ovrmTextureFormat;

namespace ovrmConstants {
const static ovrmPosef identityPose = { { 0, 0, 0, 1 }, { 0, 0, 0 } };
const static ovrmPoseStatef identityPoseState = { { { 0, 0, 0, 1 }, { 0, 0, 0 } }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }, { 0, 0, 0 }, 0 };
const static ovrmFrustum2f identityFrustum2 = { 0, 0, { 0, 0, 0, 0 } };
const static ovrmVector3f vec3Zero = { 0, 0, 0 };
const static ovrmVector2f vec2Zero = { 0, 0 };
const static ovrmVector3f vec3One = { 1, 1, 1 };
const static ovrmQuatf identifyQuat = { 0, 0, 0, 1 };
const static ovrmCameraIntrinsics invalidCameraIntrinsics = { ovrmBool_False, -1, { 0, 0, 0, 0 }, 0, 0, { 0, 0 } };
const static ovrmCameraExtrinsics invalidCameraExtrinsics = { ovrmBool_False,
                                                              -1,
                                                              ovrmCameraStatus_None,
                                                              ovrmNode_None,
                                                              { { 0, 0, 0, 1 }, { 0, 0, 0 } } };
const static uint32_t Magic = 0x2877AF94;
}

/// Texture handle which can be cast to GLuint, VkImage, ID3D11Texture2D*, or ID3D12Resource*
typedef unsigned long long ovrmTextureHandle;

enum class PayloadType : uint32_t {
    VIDEO_DIMENSION = 10,
    VIDEO_DATA = 11,
    AUDIO_SAMPLERATE = 12,
    AUDIO_DATA = 13,
    CAPTURE_CONTROL_DATA = 14,
    DATA_VERSION = 15,
};

typedef struct {
    uint32_t Magic;
    uint32_t TotalDataLengthExcludingMagic;
    uint32_t PayloadType;
    uint32_t PayloadLength;
} ovrmPayloadHeader;

/*
  A capture control data data structure is formatted as follows:
  ----------------------------------------
  |                                      |
  |           ovrmPayloadHeader          |
  |                                      |
  ----------------------------------------
  | ------------------------------------ |
  | |     Timestamp in ms (int64_t)    | |
  | ------------------------------------ |
  | | -------------------------------- | |
  | | |    CaptureControlDataType    | | |
  | | -------------------------------- | |
  | | |   Size in Bytes (uint32_t)   | | |
  | | -------------------------------- | |
  | | |                              | | |
  | | |             Data             | | |
  | | |                              | | |
  | | -------------------------------- | |
  | |                 .                | |
  | |                 .                | |
  | |                 .                | |
  | ------------------------------------ |
  ----------------------------------------
  */
enum class CaptureControlDataType : uint32_t {
    CAMERA_MATRIX = 0, // 9 floats for 3x3 matrix
    CAMERA_RESOLUTION = 1, // 2 ints for x,y size
    CAMERA_POSITION = 2, // 3 floats for a vector
    CAMERA_ORIENTATION = 3, // 4 floats for a quaternion
    CAMERA_RAW_POSITION = 4, // 3 floats for a vector
    CAMERA_RAW_ORIENTATION = 5, // 4 floats for a quaternion
    BACKDROP_COLOR = 6, // 4 uint8s for RGBA color
    MAX_ENUM = 7,
};

template <typename T>
struct ovrmCalibrationParam {
    bool IsValid = false;
    int64_t Timestamp = 0;
    T Param;
};

typedef struct {
    ovrmCalibrationParam<ovrmVector3f> CameraPosition;
    ovrmCalibrationParam<ovrmQuatf> CameraOrientation;
    ovrmCalibrationParam<ovrmMatrix3f> CameraMatrix;
    ovrmCalibrationParam<ovrmSizei> CameraResolution;
    ovrmCalibrationParam<ovrmVector3f> CameraRawPosition;
    ovrmCalibrationParam<ovrmQuatf> CameraRawOrientation;
    ovrmCalibrationParam<ovrmColor> BackdropColor;
} ovrmCalibrationData;

#endif
