#import <UIKit/UIKit.h>
#import <BaseBoard/BSAnimationSettings.h>
#import <_UIKitPrivate/UIKeyboardSceneDelegate.h>
#import <_UIKitPrivate/_UICornerInsets.h>
#import <_UIKitPrivate/_UIGestureRecognizerContainer.h>
#import <_UIKitPrivate/_UIBaselineOffsetPair.h>
#import <_UIKitPrivate/_UIHitTestContext.h>
#import <_UIKitPrivate/UILayoutAxes.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN BOOL _UIViewMaskingConfigurationSPIEnabled(void);

typedef const NSInteger _UIPlatterGroundingShadowVisibility __attribute__((swift_wrapper(struct))); // TODO

@interface UIView (Private)
+ (BOOL)_supportsInvalidatingFocusCache;
@property (nonatomic, readonly) BOOL _layoutHeightDependsOnWidth;
@property (nonatomic, readonly, nullable) UIKeyboardSceneDelegate *keyboardSceneDelegate;
@property (nonatomic, setter=_setSafeAreaCornerInsets:) _UICornerInsets _safeAreaCornerInsets;
@property (nonatomic, getter=_isFocusInteractionEnabled, setter=_setFocusInteractionEnabled:) BOOL focusInteractionEnabled;
@property (nonatomic) BOOL allowsGroupOpacity;
@property (nonatomic) BOOL allowsGroupBlending;
@property (nonatomic, setter=_setUsesPerspectiveCorrectRendering:) BOOL _usesPerspectiveCorrectRendering;
@property (nonatomic, setter=_setPreferredGroundingShadowVisibility:) _UIPlatterGroundingShadowVisibility _preferredGroundingShadowVisibility;
@property (nonatomic, setter=_setExternalHitTestingId:) NSUInteger _externalHitTestingId;
@property (nonatomic, readonly) UILayoutAxes _axesForDerivingIntrinsicContentSizeFromLayoutSize;
@property (nonatomic, readonly) NSArray<id<_UIGestureRecognizerContainer>> *_childGestureRecognizerContainers NS_SWIFT_NAME(_childContainers);
@property (nonatomic, readonly) Class _intelligenceBaseClass;
+ (void)_animateWithAnimationSettings:(BSAnimationSettings * _Nullable)animationSettings animations:(void (^)(void))animations completion:(void (^)(UIViewAnimatingPosition position))completion;
+ (BOOL)_isInAnimationBlockWithAnimationsEnabled;
+ (CGFloat)_currentAnimationDuration;
+ (UIViewAnimationCurve)_currentAnimationCurve;
- (__kindof UIViewController * _Nullable)_viewControllerForAncestor;
- (BOOL)_ancestorHasInvertFilterApplied;
- (UIColor *)_undimmedTintColor;
- (void)_invalidateSubviewCache;
- (void)_unregisterForGeometryChanges;
- (BOOL)_shouldAnimatePropertyWithKey:(NSString * _Nullable)key;
- (BOOL)_shouldNotifyGeometryObservers;
- (void)_registerForGeometryChanges;
- (_UIBaselineOffsetPair)_baselineOffsetsAtSize:(CGSize)size;
- (void)_didChangeToFirstResponder:(UIResponder * _Nullable)responder;
- (void)_geometryChanged:(void *)context forAncestor:(UIView *)ancestor;
- (UIResponder<_UIGestureRecognizerContainer> * _Nullable)_hitTestWithContext:(_UIHitTestContext *)context;
- (void)_safeAreaCornerInsetsDidChange;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
