#import <UIKit/UIKit.h>
#import <Spatial/Spatial.h>
#import <_UIKitPrivate/_UIGestureRecognizerContainer.h>
#import <_UIKitPrivate/UIRealityCoordinateSpace.h>
#import <CoreRE/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UIHitTestContext : NSObject
@property (readonly, nonatomic) CGFloat radius;
@property (readonly, nonatomic, nullable) UIEvent *event;
@property (readonly, nonatomic, nullable) UIResponder<_UIGestureRecognizerContainer, UIRealityCoordinateSpace> *serverHitTestedResponder;
@property (readonly, nonatomic) REEntityID serverHitTestedEntityID;
@property (readonly, nonatomic) SPPoint3D point3D;
@end

UIKIT_EXTERN _UIHitTestContext * _Nullable _UICurrentHitTestContext(void);

NS_HEADER_AUDIT_END(nullability, sendability)
