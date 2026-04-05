#import <UIKit/UIKit.h>
#import <Spatial/Spatial.h>
#import <MRUIKit/MRUIWorldTrackingCapabilities.h>
#import <MRUIKit/MRUISceneWorldAlignmentBehaviorClientComponent.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIWindowScene (MRUIPrivate)
- (SPPose3D)_mrui_systemSceneDisplacement;
- (MRUIWorldTrackingCapabilities)_worldTrackingCapabilities;
@property (readonly, nonatomic, nullable) MRUISceneWorldAlignmentBehaviorClientComponent *_mrui_worldAlignmentBehaviorClientComponent;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
