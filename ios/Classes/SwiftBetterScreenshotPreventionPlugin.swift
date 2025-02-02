import Flutter
import ScreenProtectorKit
import UIKit

public class SwiftBetterScreenshotPreventionPlugin: NSObject, FlutterPlugin {

    private var screenProtector: ScreenProtectorKit? = nil
    
    init(screenProtector: ScreenProtectorKit) {
        self.screenProtector = screenProtector
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "better_screenshot_prevention",
            binaryMessenger: registrar.messenger())
        let screenProtector: ScreenProtectorKit = ScreenProtectorKit(
            window: UIApplication.shared.delegate?.window as? UIWindow
        )
        screenProtector.configurePreventionScreenshot()
        let instance = SwiftBetterScreenshotPreventionPlugin(
            screenProtector: screenProtector)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(
        _ call: FlutterMethodCall, result: @escaping FlutterResult
    ) {
        switch call.method {
        case "preventScreenshot":
            result(preventScreenshot())
            break
        case "allowScreenshot":
            result(allowScreenshot())
            break
        default:
            result(false)
            break
        }
    }

    public func preventScreenshot() -> Bool {
        screenProtector?.enabledPreventScreenshot()
        return true
    }

    public func allowScreenshot() -> Bool {
        screenProtector?.disablePreventScreenshot()
        return true
    }
}
