#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UIUserInterfaceContainerVibrancy.h>
#import <_UIKitPrivate/UIGlassElevationLevel.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, UIPlatterGroundingShadowVisibility) {
    UIPlatterGroundingShadowVisibilityAutomatic = 0,
    UIPlatterGroundingShadowVisibilityVisible = 1,
    UIPlatterGroundingShadowVisibilityHidden = 2
};

typedef NS_ENUM(NSInteger, UIColorMaterialRenderingMode) {
    UIColorMaterialRenderingModeAutomatic = 0,
    UIColorMaterialRenderingModeAdaptiveSystemColors = 1,
    UIColorMaterialRenderingModeAdaptiveAllColors = 2
};

typedef NSInteger UIPlatterStatus;
typedef NSInteger UIUserInterfaceVibrancy;

UIKIT_EXTERN const CGFloat _UITraitCollectionDisplayCornerRadiusUnspecified NS_SWIFT_NONISOLATED;

@interface UITraitCollection (Private)
+ (id _Nullable)_existingTraitTokenReservingPlaceholderIfNecessaryWithName:(NSString *)name identifier:(NSString *)identifier;
+ (BOOL)_isPlaceholderTraitToken:(id<_UITraitTokenProtocol>)token;
@property (nonatomic, readonly, nullable) NSObject *_environmentWrapper;
- (CGFloat)_pointsPerMeter;
- (UITraitCollection *)_traitCollectionByRemovingEnvironmentWrapper;
- (void)_setEnvironmentWrapper:(NSObject * _Nullable)wrapper;
- (UIPlatterGroundingShadowVisibility)_platterGroundingShadowVisibility;
- (_UIUserInterfaceContainerVibrancy)_containerVibrancy;
- (CGFloat)displayCornerRadius;
- (UIPlatterStatus)_platterStatus;
- (NSInteger)_userInterfaceRenderingMode;
- (id _Nullable)_objectForTraitToken:(id<_UITraitTokenProtocol>)token;
- (NSInteger)_valueForNSIntegerTraitToken:(id<_UITraitTokenProtocol>)token;
- (UIUserInterfaceVibrancy)_vibrancy;
@property (readonly, nonatomic) _UIGlassElevationLevel _glassElevationLevel;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
