#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIPopoverPresentationController (Private)
// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, readonly, strong, nullable, getter=adaptiveSheetPresentationController) UISheetPresentationController *msui_adaptiveSheetPresentationController;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
