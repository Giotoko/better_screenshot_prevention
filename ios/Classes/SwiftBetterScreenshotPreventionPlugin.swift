import Flutter
import UIKit

public class SwiftBetterScreenshotPreventionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "better_screenshot_prevention", binaryMessenger: registrar.messenger())
    let instance = SwiftBetterScreenshotPreventionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
