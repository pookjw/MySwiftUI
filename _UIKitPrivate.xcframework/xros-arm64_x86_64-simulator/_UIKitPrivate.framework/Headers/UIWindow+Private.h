#import <UIKit/UIKit.h>
#import <_UIKitPrivate/_UISceneZoomInteraction.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIWindow (Private)
@property (retain, nonatomic, nullable, setter=_setSceneZoomInteraction:) _UISceneZoomInteraction *_sceneZoomInteraction;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
