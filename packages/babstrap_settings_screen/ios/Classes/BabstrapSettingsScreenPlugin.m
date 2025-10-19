#import "BabstrapSettingsScreenPlugin.h"
#if __has_include(<babstrap_settings_screen/babstrap_settings_screen-Swift.h>)
#import <babstrap_settings_screen/babstrap_settings_screen-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "babstrap_settings_screen-Swift.h"
#endif

@implementation BabstrapSettingsScreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBabstrapSettingsScreenPlugin registerWithRegistrar:registrar];
}
@end
