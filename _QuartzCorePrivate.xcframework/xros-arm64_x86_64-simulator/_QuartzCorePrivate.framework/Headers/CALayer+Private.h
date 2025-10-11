#import <QuartzCore/QuartzCore.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CALayer (Private)
@property BOOL allowsGroupBlending;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
