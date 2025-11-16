#import "include/_UIGraphicsViewBase.h"
@import _UIKitPrivate;
@import _QuartzCorePrivate;

@implementation _MSUI_UIGraphicsViewBase

- (BOOL)_shouldAnimatePropertyWithKey:(NSString *)key {
    if ([self.layer hasBeenCommitted]) {
        return [super _shouldAnimatePropertyWithKey:key];
    } else {
        return NO;
    }
}

@end
