package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;
import io.flutter.Log;

import io.flutter.embedding.engine.FlutterEngine;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  private static final String TAG = "GeneratedPluginRegistrant";
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    try {
      flutterEngine.getPlugins().add(new de.mintware.barcode_scan.BarcodeScanPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin barcode_scan2, de.mintware.barcode_scan.BarcodeScanPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.camera.CameraPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin camera, io.flutter.plugins.camera.CameraPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin flutter_plugin_android_lifecycle, io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new com.ggichure.github.hexcolor.HexcolorPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin hexcolor, com.ggichure.github.hexcolor.HexcolorPlugin", e);
    }
    try {
      flutterEngine.getPlugins().add(new io.flutter.plugins.pathprovider.PathProviderPlugin());
    } catch(Exception e) {
      Log.e(TAG, "Error registering plugin path_provider, io.flutter.plugins.pathprovider.PathProviderPlugin", e);
    }
  }
}
