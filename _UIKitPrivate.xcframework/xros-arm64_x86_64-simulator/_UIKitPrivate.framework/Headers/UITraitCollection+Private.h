#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, UIPlatterGroundingShadowVisibility) {
    UIPlatterGroundingShadowVisibilityAutomatic = 0,
    UIPlatterGroundingShadowVisibilityVisible = 1,
    UIPlatterGroundingShadowVisibilityHidden = 2
};

typedef NS_ENUM(NSInteger, UIUserInterfaceContainerVibrancy) {
    UIUserInterfaceContainerVibrancyLigherGlass = 0,
    UIUserInterfaceContainerVibrancyDarkerGlass = 1,
    UIUserInterfaceContainerVibrancyUltraDarkerGlass = 2
};

UIKIT_EXTERN const CGFloat _UITraitCollectionDisplayCornerRadiusUnspecified NS_SWIFT_NONISOLATED;

@interface UITraitCollection (Private)
@property (nonatomic, readonly, nullable) NSObject *_environmentWrapper;
@property (nonatomic, readonly) BOOL mrui_ornamentStatus;
- (CGFloat)_pointsPerMeter;
- (UITraitCollection *)_traitCollectionByRemovingEnvironmentWrapper;
- (void)_setEnvironmentWrapper:(NSObject * _Nullable)wrapper;
- (UIPlatterGroundingShadowVisibility)_platterGroundingShadowVisibility;
- (UIUserInterfaceContainerVibrancy)_containerVibrancy;
- (CGFloat)displayCornerRadius;
- (NSInteger)_platterStatus;
- (NSInteger)_userInterfaceRenderingMode;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
