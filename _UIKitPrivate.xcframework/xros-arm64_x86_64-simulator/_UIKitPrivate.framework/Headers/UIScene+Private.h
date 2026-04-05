#import <UIKit/UIKit.h>
#import <FrontBoardServices/FrontBoardServices.h>
#import <BoardServices/BoardServices.h>
#import <_UIKitPrivate/UISceneRenderingEnvironmentClientComponent.h>
#import <_UIKitPrivate/UISceneDisplayZoomBehaviorComponent.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN UISceneSessionRole const _UIWindowSceneSessionRoleVolumetricApplication;
UIKIT_EXTERN UISceneSessionRole const _UIWindowSceneSessionRoleCarPlay;

@interface UIScene (Private)
@property (nonatomic, readonly, getter=_FBSScene) FBSScene *_FBSScene;
@property (readonly, nonatomic) NSString *_sceneIdentifier;
@property (readonly, nonatomic) _UISceneDisplayZoomBehaviorComponent *_displayZoomBehaviorComponent;
- (BSServiceConnectionEndpoint * _Nullable)_currentOpenApplicationEndpoint;
- (_UISceneRenderingEnvironmentClientComponent * _Nullable)renderingEnvironment;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
