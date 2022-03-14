#!/bin/bash

TARGET=debug

WORKDIR=$(readlink -f $(dirname $0))

NAME=$(cat $WORKDIR/app/src/main/res/values/strings.xml | grep "app_name" | cut -d">" -f2 | cut -d"<" -f1 )
VERSION=$(cat $WORKDIR/app/src/main/AndroidManifest.xml | grep "versionName" | cut -d\" -f2 | cut -d\" -f1 )
PACKAGE_NAME=$(cat $WORKDIR/app/src/main/AndroidManifest.xml | grep "package" | cut -d\" -f2 | cut -d\" -f1 )

if [ "$1" == "clean" ] || [ "$2" == "clean" ] || [ "$3" == "clean" ]; then
	rm -rf $WORKDIR/../build
	rm -rf $WORKDIR/build
	rm -rf $WORKDIR/app/build
	rm -rf $WORKDIR/app/src/main/jniLibs
fi

echo "#define Q3QVERSION  \"$VERSION"\" > $WORKDIR/app/src/main/cpp/code/vr/vr_version.h

cd $WORKDIR/..

make -j $(getconf _NPROCESSORS_ONLN) $TARGET
if [ $? -ne 0 ]; then
	echo "Failed to build ioq3"
	exit 1
fi

cd $WORKDIR

./make.sh

if [ $? -ne 0 ]; then
	echo "Failed to build android project"
	exit 1
fi

ANDROID_STORAGE_LOCATION=/sdcard/Android/data/$PACKAGE_NAME/files/
APK_LOCATION=$WORKDIR/app/build/outputs/apk/debug/app-debug.apk

if [ "$1" == "install" ] || [ "$2" == "install" ] || [ "$3" == "install" ]; then
  adb install -r $APK_LOCATION
  if [ $? -ne 0 ]; then
    adb uninstall $PACKAGE_NAME
    adb install $APK_LOCATION
    if [ $? -ne 0 ]; then
      echo "Failed to install apk."
      exit 1
    fi
  fi
fi

#adb shell mkdir -p $ANDROID_STORAGE_LOCATION
#adb push --sync ~/.local/share/Steam/steamapps/common/Quake\ 3\ Arena/baseq3 $ANDROID_STORAGE_LOCATION
#if [ $? -ne 0 ]; then
#	echo "Failed to transfer files."
#	exit 1
#fi
#adb push --sync ../code/renderergl2/glsl $ANDROID_STORAGE_LOCATION/baseq3/
#if [ $? -ne 0 ]; then
#	echo "Failed to transfer shaders."
#	exit 1
#fi
#adb push --sync autoexec.cfg $ANDROID_STORAGE_LOCATION/baseq3/
#if [ $? -ne 0 ]; then
#	echo "Failed to transfer autoexec."
#	exit 1
#fi

if [ "$1" == "start" ] || [ "$2" == "start" ] || [ "$3" == "start" ]; then
  adb logcat -c
  adb shell am start -n $PACKAGE_NAME/.MainActivity
  if [ $? -ne 0 ]; then
    echo "Failed to start application."
    exit 1
  fi
  adb logcat *:S Quake3:V SDL:V DEBUG:V
fi
