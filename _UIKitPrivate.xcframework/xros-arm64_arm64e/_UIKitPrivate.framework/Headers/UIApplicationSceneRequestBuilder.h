#import <FrontBoardServices/FrontBoardServices.h>
#import <_UIKitPrivate/UIMutableApplicationSceneClientSettings.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol _UIWorkspaceSceneRequestOptionsBuilding <NSObject>
- (void)buildWorkspaceRequestOptionsForRequest:(UISceneSessionActivationRequest *)request withContinuation:(void (^)(FBSWorkspaceSceneRequestOptions * _Nullable options, NSError * _Nullable error))continuation;
// TODO
@end

@interface _UIApplicationSceneRequestBuilder : NSObject <_UIWorkspaceSceneRequestOptionsBuilding>
- (void)_customizeInitialClientSettings:(UIMutableApplicationSceneClientSettings *)settings usingRequest:(UISceneSessionActivationRequest *)request;
- (void)_customizeWorkspaceRequestOptions:(UISceneRequestOptions *)options usingRequest:(UISceneSessionActivationRequest *)request;
- (void)buildWorkspaceRequestOptionsForRequest:(UISceneSessionActivationRequest *)request withContinuation:(void (^)(FBSWorkspaceSceneRequestOptions * _Nullable options, NSError * _Nullable error))continuation;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
