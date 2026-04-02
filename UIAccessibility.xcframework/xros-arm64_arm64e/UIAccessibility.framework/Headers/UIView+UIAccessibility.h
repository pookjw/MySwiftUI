#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIView (UIAccessibility_Private)
- (BOOL)_accessibilityOverridesInvalidFrames;
- (void)_accessibilitySetOverridesInvalidFrames:(BOOL)arg1;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
