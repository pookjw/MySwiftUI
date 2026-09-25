#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIPopoverPresentationController (Private)
@property (nonatomic, setter=_setPrefersZoomTransitions:) BOOL _prefersZoomTransitions;
@property (nonatomic, setter=_setSourceEntityId:) unsigned long long _sourceEntityId;
@property (nonatomic, setter=_setSourceEntitySize:) UISize3D _sourceEntitySize;
// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, readonly, strong, nullable, getter=adaptiveSheetPresentationController) UISheetPresentationController *msui_adaptiveSheetPresentationController;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
