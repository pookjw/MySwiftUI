#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIViewController (Private)
- (BOOL)_canShowWhileLocked;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
