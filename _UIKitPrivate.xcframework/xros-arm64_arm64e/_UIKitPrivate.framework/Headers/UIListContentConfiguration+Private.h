#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIListContentConfiguration (Private)
- (CGFloat)_minimumHeightForTraitCollection:(UITraitCollection *)traitCollection;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
