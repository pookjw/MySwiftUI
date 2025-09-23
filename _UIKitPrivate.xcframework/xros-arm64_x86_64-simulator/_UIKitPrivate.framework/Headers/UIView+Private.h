#import <UIKit/UIKit.h>
#import <BaseBoard/BSAnimationSettings.h>
#import <MRUIKit/MRUIPreferenceHost.h>
#import <_UIKitPrivate/UIKeyboardSceneDelegate.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIView (Private) <MRUIPreferenceHost>
@property (nonatomic, readonly) BOOL _layoutHeightDependsOnWidth;
@property (nonatomic, readonly, nullable) UIKeyboardSceneDelegate *keyboardSceneDelegate;
+ (void)_animateWithAnimationSettings:(BSAnimationSettings * _Nullable)animationSettings animations:(void (^)(void))animations completion:(void (^)(UIViewAnimatingPosition position))completion;
- (__kindof UIViewController * _Nullable)_viewControllerForAncestor;
- (BOOL)_ancestorHasInvertFilterApplied;
- (UIColor *)_undimmedTintColor;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
