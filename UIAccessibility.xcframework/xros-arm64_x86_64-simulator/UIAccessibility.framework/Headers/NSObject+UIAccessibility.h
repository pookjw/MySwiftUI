#import <Foundation/Foundation.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface NSObject (UIAccessibility)
- (BOOL)_accessibilityOverridesInvalidFrames;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
