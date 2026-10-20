#import <QuartzCore/QuartzCore.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CAGradientLayer (Private)
@property (copy, nullable) NSArray<CAMediaTimingFunction *> *interpolations;
@property BOOL premultiplied;
@property (nullable) CGColorSpaceRef colorSpace;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
