#import <UIKit/UIKit.h>
#import <Spatial/Spatial.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIWindowSceneGeometryPreferencesVision (Private)
@property (nonatomic, setter=mrui_setVolumetric:) BOOL mrui_volumetric;
@property (nonatomic, setter=_setSize3D:) SPSize3D _size3D;
@property (nonatomic, setter=_setMinimumSize3D:) SPSize3D _minimumSize3D;
@property (nonatomic, setter=_setMaximumSize3D:) SPSize3D _maximumSize3D;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
