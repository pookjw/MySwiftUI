#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_OPTIONS(NSUInteger, UILayoutAxes) {
    UILayoutAxesNeither    = 0,
    UILayoutAxesHorizontal = 1 << 0,
    UILayoutAxesVertical   = 1 << 1,
    UILayoutAxesBoth       = (UILayoutAxesHorizontal | UILayoutAxesVertical),
};

NS_HEADER_AUDIT_END(nullability, sendability)
