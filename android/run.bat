@echo off

setlocal

set ANDROID_SDK_ROOT=%AppData%\..\Local\Android\Sdk
set adb="%ANDROID_SDK_ROOT%\platform-tools\adb.exe"
set make="%ANDROID_SDK_ROOT%\ndk\21.1.6352462\prebuilt\windows-x86_64\bin\make.exe"
set apksigner="%ANDROID_SDK_ROOT%\build-tools\29.0.2\apksigner.bat"
set JAVA_HOME=C:\Program Files\Android\Android Studio\jre\jre
set BUILD_TYPE=release
set GRADLE_BUILD_TYPE=:app:assembleRelease

pushd %~dp0\..
%make% -j %NUMBER_OF_PROCESSORS% %BUILD_TYPE%

if %ERRORLEVEL% NEQ 0 (
	popd
	echo "Failed to build ioq3"
	exit /b 1
)

pushd android

set GRADLE_EXIT_CONSOLE=1
call gradlew.bat %GRADLE_BUILD_TYPE%

if %ERRORLEVEL% NEQ 0 (
	popd
	popd
	echo "Failed to build android project"
	exit /b 1
)

set PACKAGE_NAME=com.sparkie.ioq3quest
set ANDROID_STORAGE_LOCATION=/sdcard/Android/data/%PACKAGE_NAME%/files/
set APK_LOCATION=.\app\build\outputs\apk\%BUILD_TYPE%\app-%BUILD_TYPE%.apk

REM %apksigner% sign --ks ../drbeef-release-key.keystore --out %APK_LOCATION% .\app\build\outputs\apk\%BUILD_TYPE%\app-%BUILD_TYPE%-unsigned.apk

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

%adb% shell mkdir -p %ANDROID_STORAGE_LOCATION%
%adb% push --sync "D:\Program Files (x86)\Steam\steamapps\common\Quake 3 Arena\baseq3" %ANDROID_STORAGE_LOCATION%
if %ERRORLEVEL% NEQ 0 (
	popd
	popd
	echo "Failed to transfer files."
	exit /b 1
)
%adb% push --sync ..\code\renderergl2\glsl %ANDROID_STORAGE_LOCATION%/baseq3/
if %ERRORLEVEL% NEQ 0 (
	popd
	popd
	echo "Failed to transfer shaders."
	exit /b 1
)
%adb% push --sync autoexec.cfg %ANDROID_STORAGE_LOCATION%/baseq3/
if %ERRORLEVEL% NEQ 0 (
	popd
	popd
	echo "Failed to transfer autoexec."
	exit /b 1
)

%adb% logcat -c
%adb% shell am start -n %PACKAGE_NAME%/.MainActivity
if %ERRORLEVEL% NEQ 0 (
	popd
	popd
	echo "Failed to start application."
	exit 1
)
%adb% logcat *:S Quake3:V SDL:V DEBUG:V
endlocal
