package com.sparkie.ioq3quest;

import android.os.Bundle;
import org.libsdl.app.SDLActivity;

public class MainActivity extends SDLActivity
{
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		nativeCreate(this);
		super.onCreate(savedInstanceState);
	}

	public static native void nativeCreate(MainActivity thisObject);

	static {
		System.loadLibrary("main");
	}
}
