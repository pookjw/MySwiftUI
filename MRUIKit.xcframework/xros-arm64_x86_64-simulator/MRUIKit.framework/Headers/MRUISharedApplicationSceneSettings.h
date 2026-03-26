#import <_UIKitPrivate/UIApplicationSceneSettings.h>
#import <CoreRE/CoreRE.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRUISharedApplicationSceneSettings : UIApplicationSceneSettings
@property (readonly, nonatomic) RESRT relativeTransform;
@property (readonly, nonatomic) CGFloat pointsPerMeter;
@end

NS_ASSUME_NONNULL_END
