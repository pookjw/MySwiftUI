#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UIConstraintBasedLayoutHostingView : UIView
@property (retain, nonatomic, nullable) UIView *hostedView;
- (instancetype)initWithHostedView:(UIView * _Nullable)hostedView NS_DESIGNATED_INITIALIZER;
- (void)_layoutMetricsInvalidatedForHostedView;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
