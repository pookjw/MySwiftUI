#ifndef CGBlendMode_Private_h
#define CGBlendMode_Private_h

#import <CoreGraphics/CoreGraphics.h>

typedef CF_ENUM(int32_t, CGBlendModePrivate) {
    kCGBlendModeLinearDodge = 1000,
    kCGBlendModeLinearBurn = 1001,
    kCGBlendModeLinearLight = 1002,
    kCGBlendModePinLight = 1003,
    kCGBlendModeSubtract = 1004,
    kCGBlendModeDivide = 1005,
    kCGBlendModeMaximum = 1006,
    kCGBlendModeSubtractS = 1008,
    kCGBlendModeSubtractD = 1009,
    kCGBlendModeDarkenSourceOver = 1010,
    kCGBlendModeLightenSourceOver = 1011,
    kCGBlendModeMinimum = 1012,
    kCGBlendModePlusLIgnoreAlpha = 1014,
    kCGBlendModePlusDIgnoreAlpha = 1015,
    kCGBlendModeSubtractSIgnoreAlpha = 1016,
};

#endif
