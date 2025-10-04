#import <UIKit/UIKit.h>
#import <RealitySimulationServices/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN const NSNotificationName _UIWindowSceneDidUpdateSystemUserInterfaceStyle NS_SWIFT_NONISOLATED;
UIKIT_EXTERN const NSNotificationName _UIWindowSceneDidBeginLiveResizeNotification NS_SWIFT_NONISOLATED;
UIKIT_EXTERN const NSNotificationName _UIWindowSceneDidEndLiveResizeNotification NS_SWIFT_NONISOLATED;
UIKIT_EXTERN const NSNotificationName _UISceneDidBecomeKeyNotification NS_SWIFT_NONISOLATED;
UIKIT_EXTERN const NSNotificationName _UISceneDidResignKeyNotification NS_SWIFT_NONISOLATED;

@interface UIWindowScene (Private)
@property (nonatomic) BOOL _isKeyWindowScene;
@property (nonatomic, readonly) UIUserInterfaceStyle _systemUserInterfaceStyle;
@property (nonatomic, readonly) BOOL isSnappedToSurface;
@property (nonatomic, readonly) RCPSurfaceSnappingClassification snappingSurfaceClassification;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
