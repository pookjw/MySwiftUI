#ifndef CoreColorFunctions_h
#define CoreColorFunctions_h

#import <Foundation/Foundation.h>
#import "Defines.h"
#import "CoreSystem.h"
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN BOOL CoreColorDependsOnEnvironment(id color, CoreSystem system);
MSUI_EXTERN CGColorRef _Nullable CGColorForCoreColor(CoreSystem system, id color) CF_RETURNS_NOT_RETAINED;
MSUI_EXTERN Class _Nullable CoreColorGetKitColorClass(CoreSystem system);
MSUI_EXTERN Class CoreColorClass(CoreSystem system);

NS_ASSUME_NONNULL_END

#endif
