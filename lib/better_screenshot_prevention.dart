
import 'dart:async';

import 'package:flutter/services.dart';

class BetterScreenshotPrevention {
  static const MethodChannel _channel = MethodChannel('better_screenshot_prevention');

  static Future<bool> get preventScreenshot async{
    return await _channel.invokeMethod("preventScreenshot");
  }

  static Future<bool> get allowScreenshot async{
    return await _channel.invokeMethod("allowScreenshot");
  }

}
