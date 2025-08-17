#import <UIKit/UIKit.h>
#import <BaseBoard/BSAnimationSettings.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIView (Private)
+ (void)_animateWithAnimationSettings:(BSAnimationSettings * _Nullable)animationSettings animations:(void (^)(void))animations completion:(void (^)(UIViewAnimatingPosition position))completion; 
@end

NS_HEADER_AUDIT_END(nullability, sendability)
