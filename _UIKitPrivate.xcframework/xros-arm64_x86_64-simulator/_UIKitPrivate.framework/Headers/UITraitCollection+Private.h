#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UITraitCollection (Private)
@property (nonatomic, readonly, nullable) NSObject *_environmentWrapper;
- (CGFloat)_pointsPerMeter;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
