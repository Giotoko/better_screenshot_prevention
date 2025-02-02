import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:better_screenshot_prevention/better_screenshot_prevention.dart';

void main() {
  const MethodChannel channel = MethodChannel('better_screenshot_prevention');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect('42', '42');
  });
}
