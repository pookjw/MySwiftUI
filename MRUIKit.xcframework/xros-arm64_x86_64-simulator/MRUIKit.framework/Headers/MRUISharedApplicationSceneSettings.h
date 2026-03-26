#import <_UIKitPrivate/UIApplicationSceneSettings.h>
#import <Spatial/Spatial.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRUISharedApplicationSceneSettings : UIApplicationSceneSettings
@property (readonly, nonatomic) SPAffineTransform3D relativeTransform;
@property (readonly, nonatomic) CGFloat pointsPerMeter;
@end

NS_ASSUME_NONNULL_END
