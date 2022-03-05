@echo off

setlocal

set BUILD_TYPE=release
set VERSION=0.19.0

set adb="%ANDROID_SDK_ROOT%\platform-tools\adb.exe"

pushd android

set PACKAGE_NAME=com.drbeef.ioq3quest
set ANDROID_STORAGE_LOCATION=/sdcard/ioquake3quest/
set APK_LOCATION=.\app\build\outputs\apk\%BUILD_TYPE%\ioq3quest-%BUILD_TYPE%-%VERSION%.apk

%adb% install -r %APK_LOCATION%
if %ERRORLEVEL% NEQ 0 (
	%adb% uninstall %PACKAGE_NAME%
	%adb% install %APK_LOCATION%
	if %ERRORLEVEL% NEQ 0 (
		popd
		popd
		echo "Failed to install apk."
		exit /b 1
	)
)

:END
endlocal
