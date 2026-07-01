#ifndef CoreColorFunctions_h
#define CoreColorFunctions_h

#import <Foundation/Foundation.h>
#import "Defines.h"
#import "CoreSystem.h"
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN BOOL CoreColorDependsOnEnvironment(id color, CoreSystem system);
MSUI_EXTERN CGColorRef _Nullable CGColorForCoreColor(CoreSystem system, id<NSObject> _Nullable color) CF_RETURNS_NOT_RETAINED;
MSUI_EXTERN Class _Nullable CoreColorGetKitColorClass(CoreSystem system);
MSUI_EXTERN Class _Nullable CoreColorClass(CoreSystem system);
MSUI_EXTERN BOOL CoreColorPlatformColorGetComponents(CoreSystem system, id color, CGFloat * _Nullable red, CGFloat * _Nullable green, CGFloat * _Nullable blue, CGFloat * _Nullable alpha);

NS_SWIFT_NAME(CoreColor)
@interface MySwiftUI_CoreColor : NSObject
+ (id<NSObject> _Nullable)blackColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)colorWithSystem:(CoreSystem)system cgColor:(CGColorRef)color;
+ (id<NSObject> _Nullable)systemBlueColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemBrownColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemCyanColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemGrayColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemGreenColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemIndigoColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemMintColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemOrangeColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemPinkColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemPurpleColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemRedColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemTealColorWithSystem:(CoreSystem)system;
+ (id<NSObject> _Nullable)systemYellowColorWithSystem:(CoreSystem)system;
- (void)set;
- (CGColorRef)CGColor;
- (instancetype)initWithCGColor:(CGColorRef)color;
- (id)colorWithAlphaComponent:(CGFloat)alpha;
- (void)setStroke;
- (void)setFill;
@end

NS_ASSUME_NONNULL_END

#endif
