#import <UIKit/UIKit.h>
#import <RealitySimulationServices/RealitySimulationServices.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UITraitCollection (MRUIPrivate)
@property (nonatomic, readonly, nullable) RSSPlacementTarget *mrui_placementTarget;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
