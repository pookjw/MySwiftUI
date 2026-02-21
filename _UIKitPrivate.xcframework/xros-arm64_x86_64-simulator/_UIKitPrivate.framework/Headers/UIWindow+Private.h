#import <UIKit/UIKit.h>
#import <_UIKitPrivate/_UISceneZoomInteraction.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN const NSNotificationName UIWindowWillRotateNotification NS_SWIFT_NONISOLATED;
UIKIT_EXTERN const NSNotificationName UIWindowDidRotateNotification NS_SWIFT_NONISOLATED;

@interface UIWindow (Private)
@property (retain, nonatomic, nullable, setter=_setSceneZoomInteraction:) _UISceneZoomInteraction *_sceneZoomInteraction;
- (UIScene * _Nullable)_windowHostingScene;
- (UISheetPresentationController * _Nullable)_rootSheetPresentationController;
- (UIResponder * _Nullable)firstResponder;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
