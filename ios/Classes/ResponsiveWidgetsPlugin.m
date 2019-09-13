#import "ResponsiveWidgetsPlugin.h"
#import <responsive_widgets/responsive_widgets-Swift.h>

@implementation ResponsiveWidgetsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftResponsiveWidgetsPlugin registerWithRegistrar:registrar];
}
@end
