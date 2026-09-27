#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UISize3D.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN CGSize _UISheetPageSize(UIView *);
UIKIT_EXTERN const CGFloat _UISheetGrabberTopSpacing;

typedef NS_ENUM(NSInteger, _UISheetMode) {
    _UISheetModeUnknown0 = 0,
    _UISheetModeUnknown1 = 1
};

@interface UISheetPresentationController (Private)
@property (nonatomic, readonly, getter=_isGeneratingAnimations) BOOL _generatingAnimations;
@property (nonatomic, setter=_setSourceEntityId:) unsigned long long _sourceEntityId;
@property (nonatomic, setter=_setSourceEntitySize:) UISize3D _sourceEntitySize;
@property (nonatomic, setter=_setGrabberTopSpacing:) CGFloat _grabberTopSpacing;
@property (nonatomic, setter=_setMode:) _UISheetMode _mode;
// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, getter=prefersScrollingExpandsWhenScrolledToEdge, setter=setPrefersScrollingExpandsWhenScrolledToEdge:) BOOL msui_prefersScrollingExpandsWhenScrolledToEdge NS_SWIFT_NAME(UISheetPresentationController.msui_prefersScrollingExpandsWhenScrolledToEdge);
@property (nonatomic, getter=preferredCornerRadius, setter=setPreferredCornerRadius:) CGFloat msui_preferredCornerRadius;
@property (nonatomic, getter=prefersGrabberVisible, setter=setPrefersGrabberVisible:) BOOL msui_prefersGrabberVisible NS_SWIFT_NAME(UISheetPresentationController.msui_prefersGrabberVisible);
@end

NS_HEADER_AUDIT_END(nullability, sendability)
