#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_OPTIONS(NSUInteger, MRUIImmersionStyle) {
    MRUIImmersionStyleUnspecified = 0,
    MRUIImmersionStyleNone = 1 << 0,
    MRUIImmersionStyleMixed = 1 << 1,
    MRUIImmersionStyleProgressive = 1 << 2,
    MRUIImmersionStyleFull = 1 << 3
};

MRUI_EXTERN NSString * _NSStringFromMRUIImmersionStyle(MRUIImmersionStyle);

@interface MRUIImmersionState : NSObject /* <_UISceneComponentProviding> */
@property (weak, nonatomic, getter=_scene, setter=_setScene:) UIScene *_scene;
@property (readonly, nonatomic) unsigned long effectiveImmersionStyle;
@property (readonly, nonatomic) CGFloat amountOfImmersion;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
