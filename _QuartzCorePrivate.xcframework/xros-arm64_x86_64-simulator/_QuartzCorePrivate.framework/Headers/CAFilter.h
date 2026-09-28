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

CA_EXTERN NSString * const kCAFilterMultiplyBlendMode;
CA_EXTERN NSString * const kCAFilterScreenBlendMode;
CA_EXTERN NSString * const kCAFilterOverlayBlendMode;
CA_EXTERN NSString * const kCAFilterDarkenBlendMode;
CA_EXTERN NSString * const kCAFilterLightenBlendMode;
CA_EXTERN NSString * const kCAFilterColorDodgeBlendMode;
CA_EXTERN NSString * const kCAFilterColorBurnBlendMode;
CA_EXTERN NSString * const kCAFilterSoftLightBlendMode;
CA_EXTERN NSString * const kCAFilterHardLightBlendMode;
CA_EXTERN NSString * const kCAFilterDifferenceBlendMode;
CA_EXTERN NSString * const kCAFilterExclusionBlendMode;
CA_EXTERN NSString * const kCAFilterHueBlendMode;
CA_EXTERN NSString * const kCAFilterSaturationBlendMode;
CA_EXTERN NSString * const kCAFilterColorBlendMode;
CA_EXTERN NSString * const kCAFilterLuminosityBlendMode;
CA_EXTERN NSString * const kCAFilterClear;
CA_EXTERN NSString * const kCAFilterCopy;
CA_EXTERN NSString * const kCAFilterSourceIn;
CA_EXTERN NSString * const kCAFilterSourceOut;
CA_EXTERN NSString * const kCAFilterSourceAtop;
CA_EXTERN NSString * const kCAFilterDestOver;
CA_EXTERN NSString * const kCAFilterDestIn;
CA_EXTERN NSString * const kCAFilterDestOut;
CA_EXTERN NSString * const kCAFilterDestAtop;
CA_EXTERN NSString * const kCAFilterXor;
CA_EXTERN NSString * const kCAFilterPlusD;
CA_EXTERN NSString * const kCAFilterPlusL;
CA_EXTERN NSString * const kCAFilterLinearDodgeBlendMode;
CA_EXTERN NSString * const kCAFilterLinearBurnBlendMode;
CA_EXTERN NSString * const kCAFilterLinearLightBlendMode;
CA_EXTERN NSString * const kCAFilterPinLightBlendMode;
CA_EXTERN NSString * const kCAFilterSubtractBlendMode;
CA_EXTERN NSString * const kCAFilterDivideBlendMode;
CA_EXTERN NSString * const kCAFilterMaximum;
CA_EXTERN NSString * const kCAFilterSubtractS;
CA_EXTERN NSString * const kCAFilterSubtractD;
CA_EXTERN NSString * const kCAFilterDarkenSourceOver;
CA_EXTERN NSString * const kCAFilterLightenSourceOver;
CA_EXTERN NSString * const kCAFilterMinimum;

NS_HEADER_AUDIT_END(nullability, sendability)
