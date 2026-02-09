#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIViewController (Private)
@property (nonatomic, readonly) NSUInteger childViewControllersCount;

- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldIgnoreChildFocusRegions;

// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, readonly, nullable, getter=childViewControllerForInterfaceOrientationLock) UIViewController *msui_childViewControllerForInterfaceOrientationLock;

@end

NS_HEADER_AUDIT_END(nullability, sendability)
