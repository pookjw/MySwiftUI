#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UISceneZoomInteraction : NSObject <UIInteraction>
@property (nonatomic, readonly, nullable) __kindof UIGestureRecognizer *gestureForFailureRelationships;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
