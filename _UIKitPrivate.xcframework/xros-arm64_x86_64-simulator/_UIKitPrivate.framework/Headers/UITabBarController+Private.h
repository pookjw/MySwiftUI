#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UITabBarController (Private)
@property (nonatomic, readonly, getter=_isInSidebarTransition) BOOL _inSidebarTransition;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
