#import <UIKit/UIKit.h>
#import <FrontBoardServices/FrontBoardServices.h>
#import <BoardServices/BoardServices.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN UISceneSessionRole const _UIWindowSceneSessionRoleVolumetricApplication;
UIKIT_EXTERN UISceneSessionRole const _UIWindowSceneSessionRoleCarPlay;

@interface UIScene (Private)
@property (nonatomic, readonly, getter=_FBSScene) FBSScene *_FBSScene;
- (BSServiceConnectionEndpoint * _Nullable)_currentOpenApplicationEndpoint;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
