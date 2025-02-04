import 'dart:async';

import 'package:flutter/services.dart';

/// Defines the MethodChannel.
///
/// Defines the calls to the native functionality
class BetterScreenshotPrevention {
  static const MethodChannel _channel =
      MethodChannel('better_screenshot_prevention');

  /// this funcion hides sensitive data by adding a black ovberlay to the screenshots
  static Future<bool> get preventScreenshot async {
    return await _channel.invokeMethod("preventScreenshot");
  }

  /// this function disables the back overlay and allows to take screenshots normally
  static Future<bool> get allowScreenshot async {
    return await _channel.invokeMethod("allowScreenshot");
  }
}
