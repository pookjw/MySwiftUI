#import <UIKit/UIKit.h>
#import <BaseBoard/BSAnimationSettings.h>
#import <MRUIKit/MRUIPreferenceHost.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIView (Private) <MRUIPreferenceHost>
+ (void)_animateWithAnimationSettings:(BSAnimationSettings * _Nullable)animationSettings animations:(void (^)(void))animations completion:(void (^)(UIViewAnimatingPosition position))completion;
- (__kindof UIViewController * _Nullable)_viewControllerForAncestor;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
