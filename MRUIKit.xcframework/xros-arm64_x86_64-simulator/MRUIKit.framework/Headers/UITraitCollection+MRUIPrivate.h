#import <UIKit/UIKit.h>
#import <RealitySimulationServices/RealitySimulationServices.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UITraitCollection (MRUIPrivate)
@property (nonatomic, readonly, nullable) RSSPlacementTarget *mrui_placementTarget;
@property (nonatomic, readonly) BOOL mrui_ornamentStatus;
- (UITraitCollection *)mrui_traitCollectionBySettingOrnamentStatus:(BOOL)status;
+ (UITraitCollection *)mrui_traitCollectionWithPlacementTarget:(RSSPlacementTarget *)target;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
