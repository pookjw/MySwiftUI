#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UITraitChangeObservableInternal.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(int, _UIAppearState) {
    _UIAppearStateDisappeared,
    _UIAppearStateAppearing,
    _UIAppearStateAppeared,
    _UIAppearStateDisappearing
};

UIKIT_EXTERN NSString * _NSStringFromUIViewControllerAppearState(_UIAppearState);

@interface UIViewController (Private) <UITraitChangeObservableInternal>
@property (nonatomic, readonly) NSUInteger childViewControllersCount;

- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldIgnoreChildFocusRegions;
- (_UIAppearState)_appearState;

// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, readonly, nullable, getter=childViewControllerForInterfaceOrientationLock) UIViewController *msui_childViewControllerForInterfaceOrientationLock;

- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withHandler:(UITraitChangeHandler)handler;
- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withTarget:(id)target action:(SEL)action;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
