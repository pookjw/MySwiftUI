#import <QuartzCore/QuartzCore.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CATransaction (Private)
+ (void)activateBackground:(BOOL)activateBackground;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
