#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

NS_SWIFT_UI_ACTOR
@interface UIView (_MySwiftUICChims)
+ (BOOL)areAnimationsEnabled;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
