#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, UISceneDisplayZoomBehavior) {
    UISceneDisplayZoomBehaviorUnspecified = 0,
    UISceneDisplayZoomBehaviorUnknown1 = 1,
    UISceneDisplayZoomBehaviorUnknown2 = 2
};

typedef NS_ENUM(NSInteger, UISceneWorldAlignmentBehavior) {
    UISceneWorldAlignmentBehaviorUnspecified = 0,
    UISceneWorldAlignmentBehaviorFrontFacing = 1,
    UISceneWorldAlignmentBehaviorFloorAligned = 2
};

UIKIT_EXTERN NSString * _NSStringFromUISceneWorldAlignmentBehavior(UISceneWorldAlignmentBehavior);

@interface _UIVolumetricWindowSceneActivationRequestOptions : UIWindowSceneActivationRequestOptions
@property (nonatomic, getter=_isInternal, setter=_setInternal:) BOOL _internal;
@property (nonatomic, setter=_setPreferredDisplayZoomBehavior:) UISceneDisplayZoomBehavior _preferredDisplayZoomBehavior;
@property (nonatomic, setter=_setWorldAlignmentBehavior:) UISceneWorldAlignmentBehavior _worldAlignmentBehavior;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
