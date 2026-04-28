#import <QuartzCore/QuartzCore.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CADisplayLink (Private)
- (void)setHighFrameRateReasons:(const uint32_t *)reasons count:(NSInteger)count;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
