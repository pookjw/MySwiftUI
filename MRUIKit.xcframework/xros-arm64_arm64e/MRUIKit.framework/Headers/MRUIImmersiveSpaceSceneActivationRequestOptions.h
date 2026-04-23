#import <UIKit/UIKit.h>
#import <MRUIKit/MRUIImmersionState.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, MRUIImmersiveEnvironmentBehavior) {
    MRUIImmersiveEnvironmentBehaviorDefault = 0,
    MRUIImmersiveEnvironmentBehaviorHide = 1,
    MRUIImmersiveEnvironmentBehaviorCoexist = 2
};

MRUI_EXTERN NSString * _NSStringFromMRUIImmersiveEnvironmentBehavior(MRUIImmersiveEnvironmentBehavior);

typedef NS_ENUM(NSUInteger, MRUIImmersionShape) {
    MRUIImmersionShapeAutomatic = 0,
    MRUIImmersionShapeLandscape = 1,
    MRUIImmersionShapePortrait = 2,
    MRUIImmersionShapeSpatialSafari = 3
};

MRUI_EXTERN NSString * _NSStringFromMRUIImmersionShape(MRUIImmersionShape);

@interface _MRUIImmersiveSpaceSceneActivationRequestOptions : UISceneActivationRequestOptions
@property (nonatomic, getter=_isInternal, setter=_setInternal:) BOOL _internal;
@property (copy, nonatomic, nullable, setter=_setBackgroundedSceneSessionPersistentIdentifiers:) NSSet<NSString *> *_backgroundedSceneSessionPersistentIdentifiers;
@property (nonatomic) MRUIImmersionStyle initialImmersionStyle;
@property (nonatomic) MRUIImmersionStyle allowedImmersionStyles; 
@property (nonatomic) CGFloat contentBrightness;
@property (nonatomic) CGFloat minimumAmountOfImmersion;
@property (nonatomic) CGFloat maximumAmountOfImmersion;
@property (nonatomic) CGFloat initialAmountOfImmersion;
@property (nonatomic) MRUIImmersiveEnvironmentBehavior immersiveEnvironmentBehavior;
@property (nonatomic, setter=mrui_setRequestInternalScene:) BOOL mrui_requestInternalScene;
@property (nonatomic) MRUIImmersionShape shape; 
@end

NS_HEADER_AUDIT_END(nullability, sendability)
