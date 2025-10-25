#import <UIKit/UIKit.h>
#import <BaseBoard/BSAnimationSettings.h>
#import <MRUIKit/MRUIPreferenceHost.h>
#import <_UIKitPrivate/UIKeyboardSceneDelegate.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN BOOL _UIViewMaskingConfigurationSPIEnabled(void);

@interface UIView (Private) <MRUIPreferenceHost>
@property (nonatomic, readonly) BOOL _layoutHeightDependsOnWidth;
@property (nonatomic, readonly, nullable) UIKeyboardSceneDelegate *keyboardSceneDelegate;
+ (void)_animateWithAnimationSettings:(BSAnimationSettings * _Nullable)animationSettings animations:(void (^)(void))animations completion:(void (^)(UIViewAnimatingPosition position))completion;
+ (BOOL)_isInAnimationBlockWithAnimationsEnabled;
+ (CGFloat)_currentAnimationDuration;
+ (UIViewAnimationCurve)_currentAnimationCurve;
- (__kindof UIViewController * _Nullable)_viewControllerForAncestor;
- (BOOL)_ancestorHasInvertFilterApplied;
- (UIColor *)_undimmedTintColor;
- (void)_invalidateSubviewCache;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
