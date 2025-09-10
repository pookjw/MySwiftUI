#ifndef SPPoint3D_h
#define SPPoint3D_h

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

NS_ASSUME_NONNULL_END

#endif
