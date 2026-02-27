#import <Foundation/Foundation.h>
#import <RealitySimulationServices/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSSPlacementTarget : NSObject <NSSecureCoding>
- (RSSAnchoredPlane)anchoredPlane;
+ (RSSPlacementTarget *)placementTargetWithAlignment:(RSSSceneAlignment)alignment;
@end

NS_ASSUME_NONNULL_END
