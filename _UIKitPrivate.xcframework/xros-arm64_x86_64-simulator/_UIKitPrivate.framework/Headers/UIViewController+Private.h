#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIViewController (Private)
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldIgnoreChildFocusRegions;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
