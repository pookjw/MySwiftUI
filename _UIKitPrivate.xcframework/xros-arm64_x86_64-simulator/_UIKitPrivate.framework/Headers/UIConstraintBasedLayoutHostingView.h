#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UIConstraintBasedLayoutHostingView : UIView
@property (retain, nonatomic) UIView *hostedView;
- (instancetype)initWithHostedView:(UIView *)hostedView;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
