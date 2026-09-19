#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UITraitChangeObservableInternal.h>
#import <_UIKitPrivate/Misc.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(int, _UIAppearState) {
    _UIAppearStateDisappeared,
    _UIAppearStateAppearing,
    _UIAppearStateAppeared,
    _UIAppearStateDisappearing
};

UIKIT_EXTERN NSString * _NSStringFromUIViewControllerAppearState(_UIAppearState);

@interface UIViewController (Private) <UITraitChangeObservableInternal>
+ (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)screenSize;

@property (nonatomic, readonly) NSUInteger childViewControllersCount;
@property (readonly, nonatomic) BOOL _willPreemptRunningPresentationTransition;
@property (readonly, nonatomic) BOOL _willPreemptRunningTransitionForDismissal;
@property (nonatomic, readonly) _UIBreakthroughMode _preferredBreakthroughMode;
@property (nonatomic, readonly, nullable) UIView *_showcaseView;
+ (void)_performWithoutDeferringTransitions:(void (NS_NOESCAPE ^)(void))block;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldIgnoreChildFocusRegions;
- (_UIAppearState)_appearState;
- (void)_endDelayingPresentation;
- (void)_beginDelayingPresentation:(NSTimeInterval)delay cancellationHandler:(BOOL (^)(BOOL))cancellationHandler;

// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, readonly, nullable, getter=childViewControllerForInterfaceOrientationLock) UIViewController *msui_childViewControllerForInterfaceOrientationLock;

- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withHandler:(UITraitChangeHandler)handler;
- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withTarget:(id)target action:(SEL)action;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
