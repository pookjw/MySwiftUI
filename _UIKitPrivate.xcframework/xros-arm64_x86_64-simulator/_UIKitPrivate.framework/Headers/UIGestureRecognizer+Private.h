#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIGestureRecognizer (Private)
- (void)removeFailureRequirement:(UIGestureRecognizer *)otherGestureRecognizer;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
