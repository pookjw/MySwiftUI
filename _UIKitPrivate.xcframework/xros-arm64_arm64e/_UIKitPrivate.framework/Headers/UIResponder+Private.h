#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIResponder (Private)
- (UIWindow * _Nullable)_window;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
