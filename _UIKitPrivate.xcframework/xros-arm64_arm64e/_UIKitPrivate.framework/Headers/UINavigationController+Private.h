#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UINavigationController (Private)
- (BOOL)_supportsDataDrivenNavigation;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
