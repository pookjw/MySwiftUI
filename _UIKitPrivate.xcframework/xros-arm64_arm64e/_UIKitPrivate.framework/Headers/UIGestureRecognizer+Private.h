#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIGestureRecognizer (Private)
- (void)removeFailureRequirement:(UIGestureRecognizer *)otherGestureRecognizer;
- (BOOL)_isGestureType:(NSInteger)gestureType;
- (BOOL)_canBeCancelledByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_SWIFT_NAME(_canBeCancelled(by:));
@end

NS_HEADER_AUDIT_END(nullability, sendability)
