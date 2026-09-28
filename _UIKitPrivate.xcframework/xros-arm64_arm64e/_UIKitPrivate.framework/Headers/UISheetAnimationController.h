#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UIViewControllerTransitioning+Private.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UISheetAnimationController : NSObject <UIViewControllerAnimatedTransitioning_Internal>
@property (nonatomic) BOOL isReversed;
@property (nonatomic) CGRect sourceFrame;
@property (weak, nonatomic, nullable) UIView *sourceView;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
