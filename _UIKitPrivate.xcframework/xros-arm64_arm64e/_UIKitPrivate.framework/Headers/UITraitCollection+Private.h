#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UIUserInterfaceContainerVibrancy.h>
#import <_UIKitPrivate/UIGlassElevationLevel.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol UIMutableTraitsPrivate <UIMutableTraits>
// TODO
@end

@protocol UIMutableTraitsInternal <UIMutableTraitsPrivate>
- (id)_objectForTraitToken:(id<_UITraitTokenProtocol>)arg1;
- (void)_setNSIntegerValue:(NSInteger)arg1 forTraitToken:(id)arg2;
- (void)_setNSUIntegerValue:(NSUInteger)arg1 forTraitToken:(id<_UITraitTokenProtocol>)arg2;
- (void)_setObject:(id)arg1 forTraitToken:(id<_UITraitTokenProtocol>)arg2;
- (NSInteger)_valueForNSIntegerTraitToken:(id<_UITraitTokenProtocol>)arg1;
- (NSUInteger) _valueForNSUIntegerTraitToken:(id<_UITraitTokenProtocol>)arg1;
// TODO
@end


typedef NS_ENUM(NSInteger, UIPlatterGroundingShadowVisibility) {
    UIPlatterGroundingShadowVisibilityAutomatic = 0,
    UIPlatterGroundingShadowVisibilityVisible = 1,
    UIPlatterGroundingShadowVisibilityHidden = 2
};

typedef NSInteger UIPlatterStatus;
typedef NSInteger UIUserInterfaceVibrancy;

UIKIT_EXTERN const CGFloat _UITraitCollectionDisplayCornerRadiusUnspecified NS_SWIFT_NONISOLATED;

@interface UITraitCollection (Private) <UIMutableTraitsInternal>
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
- (void)_setNSIntegerValue:(NSInteger)value forTraitToken:(id<_UITraitTokenProtocol>)token;
- (UIUserInterfaceVibrancy)_vibrancy;
@property (readonly, nonatomic) _UIGlassElevationLevel _glassElevationLevel;
- (void)_setObject:(id _Nullable)object forTraitToken:(id<_UITraitTokenProtocol>)token;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
