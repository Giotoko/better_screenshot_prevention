
import 'dart:async';

import 'package:flutter/services.dart';

class BetterScreenshotPrevention {
  static const MethodChannel _channel = MethodChannel('better_screenshot_prevention');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
