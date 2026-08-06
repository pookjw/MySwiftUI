#import <UIKit/UIKit.h>
#import <MRUIKit/MRUIPlatterOrnamentManager.h>
#import <CoreRE/CoreRE.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

MRUI_EXTERN BOOL _MRUISceneSessionRoleRepresentsImmersiveSpace(UISceneSessionRole);

@interface UIScene (MRUIPrivate)
@property (nonatomic, readonly) BOOL _mrui_supportsRelativeTransform;
@property (nonatomic, readonly) RESRT _mrui_relativeTransform;
@property (nonatomic, readonly, nullable) MRUIPlatterOrnamentManager* _mrui_platterOrnamentManager;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
