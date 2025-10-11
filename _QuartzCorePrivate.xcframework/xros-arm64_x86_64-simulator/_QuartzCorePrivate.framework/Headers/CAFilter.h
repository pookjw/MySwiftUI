#import <QuartzCore/QuartzCore.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CAFilter : NSObject <NSMutableCopying, NSSecureCoding>
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithType:(NSString *)type;
@end

CA_EXTERN NSString * const kCAFilterPlusLIgnoreAlpha;
CA_EXTERN NSString * const kCAFilterSubtractSIgnoreAlpha;
CA_EXTERN NSString * const kCAFilterDestOutPassthrough;
CA_EXTERN NSString * const kCAFilterPlusDIgnoreAlpha;
CA_EXTERN NSString * const kCAFilterInputAmount;

NS_HEADER_AUDIT_END(nullability, sendability)
