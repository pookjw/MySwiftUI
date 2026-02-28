#include "include/CoreColorFunctions.h"

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

#if TARGET_OS_OSX
#import <Cocoa/Cocoa.h>
#endif

#include <objc/runtime.h>

BOOL CoreColorDependsOnEnvironment(id color, CoreSystem system) {
    static Method method;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class colorClass = CoreColorClass(system);
        method = [colorClass instanceMethodForSelector:@selector(resolvedColorWithTraitCollection:)];
    });
    
    Method incomingMethod = [color methodForSelector:@selector(resolvedColorWithTraitCollection:)];
    return method != incomingMethod;
}

CGColorRef _Nullable CGColorForCoreColor(CoreSystem system, id color) {
    abort();
}

Class _Nullable CoreColorGetKitColorClass(CoreSystem system) {
    abort();
}

Class CoreColorClass(CoreSystem system) {
    static Class colorClass;
    static dispatch_once_t uiOnce;
    dispatch_once(&uiOnce, ^{
        if (system == CoreSystemUIKit) {
            colorClass = NSClassFromString(@"UIColor");
        }
    });
    
    return colorClass;
}
