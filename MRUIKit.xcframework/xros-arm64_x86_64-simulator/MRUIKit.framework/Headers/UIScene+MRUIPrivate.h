#import <UIKit/UIKit.h>
#import <MRUIKit/MRUIPlatterOrnamentManager.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

MRUI_EXTERN BOOL _MRUISceneSessionRoleRepresentsImmersiveSpace(UISceneSessionRole);

@interface UIScene (MRUIPrivate)
@property (nonatomic, readonly, nullable) MRUIPlatterOrnamentManager* _mrui_platterOrnamentManager;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
