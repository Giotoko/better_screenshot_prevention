#import "BetterScreenshotPreventionPlugin.h"
#if __has_include(<better_screenshot_prevention/better_screenshot_prevention-Swift.h>)
#import <better_screenshot_prevention/better_screenshot_prevention-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "better_screenshot_prevention-Swift.h"
#endif

@implementation BetterScreenshotPreventionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBetterScreenshotPreventionPlugin registerWithRegistrar:registrar];
}
@end
