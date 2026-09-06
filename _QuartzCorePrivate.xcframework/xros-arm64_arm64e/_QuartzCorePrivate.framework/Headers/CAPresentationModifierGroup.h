#import <QuartzCore/QuartzCore.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CAPresentationModifierGroup : NSObject
+ (CAPresentationModifierGroup * _Nullable)groupWithCapacity:(NSUInteger)capacity;
@property (readonly) NSUInteger capacity;
@property (readonly) NSUInteger count;
@property (nonatomic) BOOL updatesAsynchronously;
- (void)flushLocallyWithTargetTime:(CFTimeInterval)targetTime;
- (void)flushWithTransactionAndTargetTime:(CFTimeInterval)targetTime NS_SWIFT_NAME(flushWithTransaction(andTargetTime:));
@end

NS_HEADER_AUDIT_END(nullability, sendability)
