package com.jhonaiquel.better_screenshot_prevention

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import android.view.WindowManager.LayoutParams
import android.app.Activity

/** BetterScreenshotPreventionPlugin */
class BetterScreenshotPreventionPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private lateinit var channel : MethodChannel
  private var activity: Activity? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "better_screenshot_prevention")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

    when(call.method){
      "preventScreenshot" -> result.success(preventScreenshot())
      "allowScreenshot" -> result.success(allowScreenshot())
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
}

override fun onDetachedFromActivityForConfigChanges() {
}

override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
}

override fun onDetachedFromActivity() {}

  fun preventScreenshot () : Boolean {
    activity?.getWindow()?.addFlags(LayoutParams.FLAG_SECURE)
    return true
  }

  fun allowScreenshot () : Boolean {
    activity?.getWindow()?.clearFlags(LayoutParams.FLAG_SECURE)
    return true
  }

}
