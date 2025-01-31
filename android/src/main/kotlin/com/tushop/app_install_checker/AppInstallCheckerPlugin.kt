package com.tushop.app_install_checker

import android.content.Context
import android.content.SharedPreferences
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AppInstallCheckerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

  private lateinit var channel: MethodChannel
  private lateinit var sharedPreferences: SharedPreferences

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    // Create a MethodChannel for communication with Flutter
    channel = MethodChannel(binding.binaryMessenger, "app_install_checker")
    channel.setMethodCallHandler(this)

    // Initialize SharedPreferences for storing app install/launch data
    sharedPreferences =
            binding.applicationContext.getSharedPreferences(
                    "app_install_checker_prefs",
                    Context.MODE_PRIVATE
            )
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    // Clean up the channel
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (call.method == "checkInstallAndLaunch") {
      val isFirstInstall = sharedPreferences.getBoolean("first_install", true)
      val isFirstLaunch = sharedPreferences.getBoolean("first_launch", true)

      // Mark the app as installed if it's the first install
      if (isFirstInstall) {
        sharedPreferences.edit().putBoolean("first_install", false).apply()
      }

      // Mark the app as launched if it's the first launch
      if (isFirstLaunch) {
        sharedPreferences.edit().putBoolean("first_launch", false).apply()
      }

      // Return the result to Flutter
      result.success(listOf(isFirstInstall, isFirstLaunch))
    } else {
      result.notImplemented()
    }
  }
}
