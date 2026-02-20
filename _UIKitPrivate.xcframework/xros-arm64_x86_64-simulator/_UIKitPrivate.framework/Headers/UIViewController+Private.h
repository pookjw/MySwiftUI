#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(int, _UIAppearState) {
    _UIAppearStateDisappeared,
    _UIAppearStateAppearing,
    _UIAppearStateAppeared,
    _UIAppearStateDisappearing
};

UIKIT_EXTERN NSString * _NSStringFromUIViewControllerAppearState(_UIAppearState);

@interface UIViewController (Private)
@property (nonatomic, readonly) NSUInteger childViewControllersCount;

- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldIgnoreChildFocusRegions;
- (_UIAppearState)_appearState;

// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, readonly, nullable, getter=childViewControllerForInterfaceOrientationLock) UIViewController *msui_childViewControllerForInterfaceOrientationLock;

@end

NS_HEADER_AUDIT_END(nullability, sendability)
