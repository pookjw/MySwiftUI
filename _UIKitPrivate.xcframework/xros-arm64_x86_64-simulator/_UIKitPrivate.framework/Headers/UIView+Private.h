#import <UIKit/UIKit.h>
#import <BaseBoard/BSAnimationSettings.h>
#import <MRUIKit/MRUIPreferenceHost.h>
#import <_UIKitPrivate/UIKeyboardSceneDelegate.h>
#import <_UIKitPrivate/_UICornerInsets.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN BOOL _UIViewMaskingConfigurationSPIEnabled(void);

@interface UIView (Private) <MRUIPreferenceHost>
@property (nonatomic, readonly) BOOL _layoutHeightDependsOnWidth;
@property (nonatomic, readonly, nullable) UIKeyboardSceneDelegate *keyboardSceneDelegate;
@property (nonatomic, setter=_setSafeAreaCornerInsets:) _UICornerInsets _safeAreaCornerInsets;
@property (nonatomic, getter=_isFocusInteractionEnabled, setter=_setFocusInteractionEnabled:) BOOL focusInteractionEnabled;
@property (nonatomic) BOOL allowsGroupOpacity;
@property (nonatomic) BOOL allowsGroupBlending;
+ (void)_animateWithAnimationSettings:(BSAnimationSettings * _Nullable)animationSettings animations:(void (^)(void))animations completion:(void (^)(UIViewAnimatingPosition position))completion;
+ (BOOL)_isInAnimationBlockWithAnimationsEnabled;
+ (CGFloat)_currentAnimationDuration;
+ (UIViewAnimationCurve)_currentAnimationCurve;
- (__kindof UIViewController * _Nullable)_viewControllerForAncestor;
- (BOOL)_ancestorHasInvertFilterApplied;
- (UIColor *)_undimmedTintColor;
- (void)_invalidateSubviewCache;
- (void)_unregisterForGeometryChanges;
- (BOOL)_shouldAnimatePropertyWithKey:(NSString *)key;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
