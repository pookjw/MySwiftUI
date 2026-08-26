#import <UIKit/UIKit.h>
#import <CoreRE/CoreRE.h>
#import <_UIKitPrivate/UIHitTestContext.h>
#import <_UIKitPrivate/_UIGestureRecognizerContainer.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIEntityResponder : UIResponder
@property (readonly, nonatomic, nullable) REEntity reEntity;
- (UIResponder<_UIGestureRecognizerContainer> * _Nullable)_hitTestWithContext:(_UIHitTestContext *)context;
- (void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;
- (void)removeGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;
@end

@interface UIEntityResponder (UIEntityResponderCreation)
+ (UIEntityResponder * _Nullable)responderForEntity:(REEntity)entity;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
