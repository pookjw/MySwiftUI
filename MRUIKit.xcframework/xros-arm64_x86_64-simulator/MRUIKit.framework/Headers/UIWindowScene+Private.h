#import <UIKit/UIKit.h>
#import <Spatial/Spatial.h>
#import <MRUIKit/MRUIWorldTrackingCapabilities.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIWindowScene (Private)
- (SPPose3D)_mrui_systemSceneDisplacement;
- (MRUIWorldTrackingCapabilities)_worldTrackingCapabilities;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
