#include "include/CoreColorFunctions.h"

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

#if TARGET_OS_OSX
#import <Cocoa/Cocoa.h>
#endif

#include <objc/runtime.h>

BOOL CoreColorDependsOnEnvironment(id color, CoreSystem system) {
    static IMP method;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class colorClass = CoreColorClass(system);
        method = [colorClass instanceMethodForSelector:@selector(resolvedColorWithTraitCollection:)];
    });
    
    IMP incomingMethod = [color methodForSelector:@selector(resolvedColorWithTraitCollection:)];
    return method != incomingMethod;
}

CGColorRef _Nullable CGColorForCoreColor(CoreSystem system, id<NSObject> _Nullable color) {
    if (color == nil) return nil;
    return [color CGColor];
}

Class _Nullable CoreColorGetKitColorClass(CoreSystem system) {
    abort();
}

Class _Nullable CoreColorClass(CoreSystem system) {
    static Class uiClass = nil;
    static dispatch_once_t uiOnce;
    dispatch_once(&uiOnce, ^{
        if (system == CoreSystemUIKit) {
            uiClass = NSClassFromString(@"UIColor");
        }
    });
    
    return uiClass;
}

BOOL CoreColorPlatformColorGetComponents(CoreSystem system, id color, CGFloat *red, CGFloat *green, CGFloat *blue, CGFloat *alpha) {
    Class colorClass = CoreColorClass(system);
    if (colorClass == nil) return NO;
    
    return [color getRed:red green:green blue:blue alpha:alpha];
}


@implementation MySwiftUI_CoreColor {
    CGColorRef _color;
}

+ (id<NSObject> _Nullable)blackColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) blackColor];
}

+ (id<NSObject> _Nullable)colorWithSystem:(CoreSystem)system cgColor:(CGColorRef)color {
    Class _Nullable uiClass = CoreColorClass(system);
    
    if (uiClass) {
        return [uiClass colorWithCGColor:color];
    } else {
        return [[[MySwiftUI_CoreColor alloc] initWithCGColor:color] autorelease];
    }
}

+ (id<NSObject> _Nullable)systemBlueColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemBlueColor];
}

+ (id<NSObject> _Nullable)systemBrownColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemBrownColor];
}

+ (id<NSObject> _Nullable)systemCyanColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemCyanColor];
}

+ (id<NSObject> _Nullable)systemGrayColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemGrayColor];
}

+ (id<NSObject> _Nullable)systemGreenColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemGreenColor];
}

+ (id<NSObject> _Nullable)systemIndigoColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemIndigoColor];
}

+ (id<NSObject> _Nullable)systemMintColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemMintColor];
}

+ (id<NSObject> _Nullable)systemOrangeColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemOrangeColor];
}

+ (id<NSObject> _Nullable)systemPinkColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemPinkColor];
}

+ (id<NSObject> _Nullable)systemPurpleColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemPurpleColor];
}

+ (id<NSObject> _Nullable)systemRedColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemRedColor];
}

+ (id<NSObject> _Nullable)systemTealColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemTealColor];
}

+ (id<NSObject> _Nullable)systemYellowColorWithSystem:(CoreSystem)system {
    return [CoreColorClass(system) systemYellowColor];
}

- (void)dealloc {
    CGColorRelease(_color);
    [super dealloc];
}

- (void)set {
    abort();
}

- (CGColorRef)CGColor {
    return _color;
}

- (instancetype)initWithCGColor:(CGColorRef)color {
    abort();
}

- (id)colorWithAlphaComponent:(CGFloat)alpha {
    CGColorRef newColor = CGColorCreateCopyWithAlpha(_color, alpha);
    
    // FIXME
    MySwiftUI_CoreColor *result = [MySwiftUI_CoreColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
    
    return result;
}

- (void)setStroke {
    abort();
}

- (void)setFill {
    abort();
}

@end
