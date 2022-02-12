package com.drbeef.ioq3quest;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.inputmethod.InputMethodManager;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import org.libsdl.app.SDLActivity;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import static android.system.Os.setenv;

public class MainActivity extends SDLActivity
{
	private int permissionCount = 0;
	private static final int READ_EXTERNAL_STORAGE_PERMISSION_ID = 1;
	private static final int WRITE_EXTERNAL_STORAGE_PERMISSION_ID = 2;
	private static final String TAG = "ioquake3Quest";

	String commandLineParams;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		Log.i(TAG,"onCreate called");
		try {
			checkPermissionsAndInitialize();
		} catch (Exception e) {}
		super.onCreate(savedInstanceState);

		//InputMethodManager imm = (InputMethodManager)   getSystemService(Context.INPUT_METHOD_SERVICE);
		//imm.toggleSoftInput(InputMethodManager.SHOW_FORCED, 0);
	}

	/** Initializes the Activity only if the permission has been granted. */
	private void checkPermissionsAndInitialize() throws IOException {
		// Boilerplate for checking runtime permissions in Android.
		if (ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE)
				!= PackageManager.PERMISSION_GRANTED){
			ActivityCompat.requestPermissions(this,
					new String[]{Manifest.permission.READ_EXTERNAL_STORAGE,
							Manifest.permission.WRITE_EXTERNAL_STORAGE},
					WRITE_EXTERNAL_STORAGE_PERMISSION_ID);
		}
		else
		{
			// Permissions have already been granted.
			create();
		}
	}

	/** Handles the user accepting the permission. */
	@Override
	public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
		if (requestCode == WRITE_EXTERNAL_STORAGE_PERMISSION_ID) {
			finish();
			System.exit(0);
		}
	}

	public static void unzip(File zipFile, File targetDirectory) throws IOException {
		ZipInputStream zis = new ZipInputStream(
				new BufferedInputStream(new FileInputStream(zipFile)));
		try {
			ZipEntry ze;
			int count;
			byte[] buffer = new byte[8192];
			while ((ze = zis.getNextEntry()) != null) {
				File file = new File(targetDirectory, ze.getName());
				File dir = ze.isDirectory() ? file : file.getParentFile();
				if (!dir.isDirectory() && !dir.mkdirs())
					throw new FileNotFoundException("Failed to ensure directory: " +
							dir.getAbsolutePath());
				if (ze.isDirectory())
					continue;
				FileOutputStream fout = new FileOutputStream(file);
				try {
					while ((count = zis.read(buffer)) != -1)
						fout.write(buffer, 0, count);
				} finally {
					fout.close();
				}
			}
		} finally {
			zis.close();
		}
	}

	public void create() throws IOException {
		//Make the directories
		new File("/sdcard/ioquake3Quest/baseq3").mkdirs();

		//Copy the command line params file
		copy_asset("/sdcard/ioquake3Quest", "commandline.txt", false);
		copy_asset("/sdcard/ioquake3Quest/baseq3", "autoexec.cfg", false);

		//copy demo
		copy_asset("/sdcard/ioquake3Quest/baseq3", "pak0.pk3", false);

		//glsl
		copy_asset("/sdcard/ioquake3Quest", "glsl.zip", true);
		new File("/sdcard/ioquake3Quest/baseq3/glsl").mkdirs();
		unzip(new File("/sdcard/ioquake3Quest/glsl.zip"), new File("/sdcard/ioquake3Quest/baseq3/glsl"));
		new File("/sdcard/ioquake3Quest/glsl.zip").delete();

		//Read these from a file and pass through
		commandLineParams = new String();

		//See if user is trying to use command line params
		if (new File("/sdcard/ioquake3Quest/commandline.txt").exists())
		{
			BufferedReader br;
			try {
				br = new BufferedReader(new FileReader("/sdcard/ioquake3Quest/commandline.txt"));
				String s;
				StringBuilder sb = new StringBuilder(0);
				while ((s = br.readLine()) != null)
					sb.append(s + " ");
				br.close();

				commandLineParams = new String(sb.toString());
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Log.d(TAG, "setting env");
		try {
			setenv("commandline", commandLineParams, true);
		}
		catch (Exception e)
		{
		}

		Log.d(TAG, "nativeCreate");
		nativeCreate(this);
	}

	public void copy_asset(String path, String name, boolean force) {
		File f = new File(path + "/" + name);
		if (!f.exists() || force) {

			//Ensure we have an appropriate folder
			String fullname = path + "/" + name;
			String directory = fullname.substring(0, fullname.lastIndexOf("/"));
			new File(directory).mkdirs();
			_copy_asset(name, path + "/" + name);
		}
	}

	public void _copy_asset(String name_in, String name_out) {
		AssetManager assets = this.getAssets();

		try {
			InputStream in = assets.open(name_in);
			OutputStream out = new FileOutputStream(name_out);

			copy_stream(in, out);

			out.close();
			in.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public static void copy_stream(InputStream in, OutputStream out)
			throws IOException {
		byte[] buf = new byte[1024];
		while (true) {
			int count = in.read(buf);
			if (count <= 0)
				break;
			out.write(buf, 0, count);
		}
	}

	public static native void nativeCreate(MainActivity thisObject);

	static {
		System.loadLibrary("main");
	}
}
