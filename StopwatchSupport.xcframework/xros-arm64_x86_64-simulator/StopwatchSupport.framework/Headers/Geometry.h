#ifndef Geometry_h
#define Geometry_h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <StopwatchSupport/Defines.h>

NS_ASSUME_NONNULL_BEGIN

struct SPPoint3D {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};
typedef struct SPPoint3D SPPoint3D;

struct SPVector3D {
    CGFloat x, y, z, a, b, c;
};
typedef struct SPVector3D SPVector3D;

union SPSize3D {
    CGFloat x, y, z;
    SPVector3D vector;
};
typedef union SPSize3D SPSize3D;

NS_ASSUME_NONNULL_END

#endif
