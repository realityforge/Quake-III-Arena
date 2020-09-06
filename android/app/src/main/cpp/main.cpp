#include <jni.h>
#include <memory.h>
#include <string.h>

#include <android/log.h>

#include <VrApi.h>
#include <VrApi_Helpers.h>
#include <string>

extern "C" {
	#include <qcommon/q_shared.h>
	#include <qcommon/qcommon.h>
	#include <vr/vr_base.h>
	#include <vr/vr_renderer.h>

	#include <SDL.h>

	extern void CON_LogcatFn( void (*LogcatFn)( const char* message ) );
}

#define LOGI(...) ((void)__android_log_print(ANDROID_LOG_INFO, "Quake3", __VA_ARGS__))
#define LOGW(...) ((void)__android_log_print(ANDROID_LOG_WARN, "Quake3", __VA_ARGS__))
#define LOGE(...) ((void)__android_log_print(ANDROID_LOG_ERROR, "Quake3", __VA_ARGS__))
#define LOGF(...) ((void)__android_log_print(ANDROID_LOG_FATAL, "Quake3", __VA_ARGS__))

static JNIEnv* g_Env = NULL;
static JavaVM* g_JavaVM = NULL;
static jobject g_ActivityObject = NULL;

extern "C"
{
	JNIEXPORT void JNICALL Java_com_sparkie_ioq3quest_MainActivity_nativeCreate(JNIEnv* env, jclass cls, jobject thisObject)
	{
		g_ActivityObject = env->NewGlobalRef(thisObject);
	}

	JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved)
	{
		g_JavaVM = vm;
		if (g_JavaVM->GetEnv((void**) &g_Env, JNI_VERSION_1_4) != JNI_OK) {
			return -1;
		}

		return JNI_VERSION_1_4;
	}
}

static void ioq3_logfn(const char* msg)
{
	LOGI("%s", msg);
}

static ovrJava engine_get_ovrJava() {
	ovrJava java;
	java.Vm = g_JavaVM;
	java.ActivityObject = g_ActivityObject;
	java.Vm->AttachCurrentThread(&java.Env, NULL);
	return java;
}

int main(int argc, char* argv[]) {
	CON_LogcatFn(&ioq3_logfn);

	std::string defaultArgs("+set fs_basepath ");
	defaultArgs += SDL_AndroidGetExternalStoragePath();
	defaultArgs += " +set fs_game baseq3 +map q3dm6";

	char* args = new char[defaultArgs.length() + 1];
	args[defaultArgs.length()] = '\0';
	memcpy(args, defaultArgs.c_str(), defaultArgs.length());
	Com_Init(args);

	ovrJava java = engine_get_ovrJava();

	constexpr auto vrEnabled = true;
	engine_t* engine = nullptr;

	if (vrEnabled)
	{
		engine = VR_Init(java);
		VR_InitRenderer(engine);

		VR_EnterVR(engine, java);
	}

	while (1) {
		SDL_Event event;
		while (SDL_PollEvent(&event)) {
			LOGI("Received SDL Event: %d", event.type);
			if (vrEnabled)
			{
				switch (event.type)
				{
					case SDL_WINDOWEVENT_FOCUS_GAINED:
						VR_EnterVR(engine, engine_get_ovrJava());
						break;

					case SDL_WINDOWEVENT_FOCUS_LOST:
						VR_LeaveVR(engine);
						break;
				}
			}
		}
		if (vrEnabled)
		{
			VR_DrawFrame(engine);
		}
		else
		{
			Com_Frame();
		}
	}
	if (vrEnabled)
	{
		VR_LeaveVR(engine);
		VR_DestroyRenderer(engine);
	}

	Com_Shutdown();
	if (vrEnabled)
	{
		VR_Destroy(engine);
	}
	delete [] args;
	return 0;
}
