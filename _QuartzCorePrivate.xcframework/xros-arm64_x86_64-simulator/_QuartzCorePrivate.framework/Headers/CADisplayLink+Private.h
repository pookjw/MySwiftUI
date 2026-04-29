#import <QuartzCore/QuartzCore.h>
#import <_QuartzCorePrivate/CADisplay.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CADisplayLink (Private)
+ (CADisplayLink * _Nullable)displayLinkWithDisplay:(CADisplay *)display target:(id)target selector:(SEL)selector;
@property (readonly, nonatomic) CADisplay *display;
- (void)setHighFrameRateReasons:(const uint32_t *)reasons count:(NSInteger)count;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
