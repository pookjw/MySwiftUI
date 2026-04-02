#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UISheetPresentationController (Private)
@property (nonatomic, readonly, getter=_isGeneratingAnimations) BOOL _generatingAnimations;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
