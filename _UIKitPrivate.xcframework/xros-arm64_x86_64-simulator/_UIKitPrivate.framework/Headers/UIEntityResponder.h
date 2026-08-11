#import <UIKit/UIKit.h>
#import <CoreRE/CoreRE.h>
#import <_UIKitPrivate/UIHitTestContext.h>
#import <_UIKitPrivate/_UIGestureRecognizerContainer.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIEntityResponder : UIResponder
@property (readonly, nonatomic, nullable) REEntityRef reEntity;
- (UIResponder<_UIGestureRecognizerContainer> * _Nullable)_hitTestWithContext:(_UIHitTestContext *)context;
@end

@interface UIEntityResponder (UIEntityResponderCreation)
+ (UIEntityResponder * _Nullable)responderForEntity:(REEntityRef)entity;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
