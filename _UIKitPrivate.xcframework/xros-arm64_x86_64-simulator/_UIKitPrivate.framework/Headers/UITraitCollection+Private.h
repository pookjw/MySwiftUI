#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UITraitCollection (Private)
- (CGFloat)_pointsPerMeter;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
