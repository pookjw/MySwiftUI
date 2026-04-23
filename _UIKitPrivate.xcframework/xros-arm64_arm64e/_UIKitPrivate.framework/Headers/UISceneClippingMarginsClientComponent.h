#import <FrontBoardServices/FrontBoardServices.h>
#import <_UIKitPrivate/Misc.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol _UISceneEffectiveClippingMarginsObserver
- (void)effectiveClippingMarginsChanged:(_UIEdgeInsets3D)insets;
@end

@interface _UISceneClippingMarginsClientComponent : FBSSceneComponent
- (void)_addEffectiveClippingMarginsObserver:(id<_UISceneEffectiveClippingMarginsObserver>)observer;
- (void)_removeEffectiveClippingMarginsObserver:(id<_UISceneEffectiveClippingMarginsObserver>)observer;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
