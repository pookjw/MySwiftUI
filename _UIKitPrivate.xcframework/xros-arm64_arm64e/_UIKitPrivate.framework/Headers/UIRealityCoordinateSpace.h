#import <UIKit/UIKit.h>
#import <_QuartzCorePrivate/_QuartzCorePrivate.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol UIRealityCoordinateSpace <NSObject>
- (CAPoint3D)convertPoint:(CAPoint3D)point fromRealityCoordinateSpace:(id<UIRealityCoordinateSpace> _Nullable)coordinateSpace;
- (CAPoint3D)convertPoint:(CAPoint3D)point toRealityCoordinateSpace:(id<UIRealityCoordinateSpace> _Nullable)coordinateSpace;
- (BOOL)isRealityCoordinateSpaceType:(NSInteger)type;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
