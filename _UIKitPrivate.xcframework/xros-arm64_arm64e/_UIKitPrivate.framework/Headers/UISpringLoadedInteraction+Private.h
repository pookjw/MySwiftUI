#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UISpringLoadedInteraction (Private)
+ (id<UISpringLoadedInteractionBehavior>)_defaultInteractionBehavior;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
