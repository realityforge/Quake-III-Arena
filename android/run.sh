#!/bin/sh

cd ..

TARGET=debug

make -j24 $TARGET
if [ $? -ne 0 ]; then
	echo "Failed to build ioq3"
	exit 1
fi

cd android

./make.sh

if [ $? -ne 0 ]; then
	echo "Failed to build android project"
	exit 1
fi

PACKAGE_NAME=com.spark.ioq3quest
ANDROID_STORAGE_LOCATION=/sdcard/Android/data/$PACKAGE_NAME/files/
APK_LOCATION=./app/build/outputs/apk/debug/app-debug.apk

adb install -r $APK_LOCATION
if [ $? -ne 0 ]; then
	adb uninstall $PACKAGE_NAME
	adb install $APK_LOCATION
	if [ $? -ne 0 ]; then
		echo "Failed to install apk."
		exit 1
	fi
fi
adb shell mkdir -p $ANDROID_STORAGE_LOCATION
adb push --sync ~/.local/share/Steam/steamapps/common/Quake\ 3\ Arena/baseq3 $ANDROID_STORAGE_LOCATION
if [ $? -ne 0 ]; then
	echo "Failed to transfer files."
	exit 1
fi
adb push --sync ../code/renderergl2/glsl $ANDROID_STORAGE_LOCATION/baseq3/
if [ $? -ne 0 ]; then
	echo "Failed to transfer shaders."
	exit 1
fi
adb push --sync autoexec.cfg $ANDROID_STORAGE_LOCATION/baseq3/
if [ $? -ne 0 ]; then
	echo "Failed to transfer autoexec."
	exit 1
fi

adb logcat -c
adb shell am start -n $PACKAGE_NAME/.MainActivity
if [ $? -ne 0 ]; then
	echo "Failed to start application."
	exit 1
fi
adb logcat *:S Quake3:V SDL:V DEBUG:V
