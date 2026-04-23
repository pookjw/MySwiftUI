#import <UIKit/UIKit.h>
#import <Spatial/Spatial.h>
#import <MRUIKit/MRUIWorldTrackingCapabilities.h>
#import <MRUIKit/MRUISceneWorldAlignmentBehaviorClientComponent.h>
#import <MRUIKit/MRUIImmersionState.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIWindowScene (MRUIPrivate)
- (SPPose3D)_mrui_systemSceneDisplacement;
- (MRUIWorldTrackingCapabilities)_worldTrackingCapabilities;
- (MRUIImmersionState *)_immersionState;
@property (readonly, nonatomic, nullable) MRUISceneWorldAlignmentBehaviorClientComponent *_mrui_worldAlignmentBehaviorClientComponent;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
