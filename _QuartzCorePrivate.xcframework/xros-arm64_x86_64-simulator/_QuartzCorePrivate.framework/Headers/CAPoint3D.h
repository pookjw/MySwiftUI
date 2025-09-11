#ifndef CAPoint3D_h
#define CAPoint3D_h

#include <CoreGraphics/CGBase.h>
#include <CoreFoundation/CFBase.h>
#include <CoreFoundation/CFAvailability.h>

CF_IMPLICIT_BRIDGING_ENABLED

CF_ASSUME_NONNULL_BEGIN

struct CAPoint3D {
    CGFloat x;
    CGFloat y;
    CGFloat z;
};
typedef struct CG_BOXABLE CAPoint3D CAPoint3D;

CG_EXTERN const CAPoint3D CAPoint3DZero;

CF_ASSUME_NONNULL_END

CF_IMPLICIT_BRIDGING_DISABLED

#endif
