#import <_UIKitPrivate/UIApplicationSceneRequestBuilder.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UIWorkspaceSceneRequestOptionsFactory <NSObject>
+ (_UIWorkspaceSceneRequestOptionsFactory *)sharedFactory;
- (void)_registerBuilder:(id<_UIWorkspaceSceneRequestOptionsBuilding>)builder forRole:(UISceneSessionRole)role;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
