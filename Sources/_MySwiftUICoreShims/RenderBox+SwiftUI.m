#import "include/RenderBox+SwiftUI.h"
@import _QuartzCorePrivate;

NSString * _Nullable _RBBlendModeGetCompositingFilter(CGBlendMode blendMode, BOOL compositingGroup) {
    switch ((int32_t)blendMode) {
        case kCGBlendModeNormal:
            return nil;
        case kCGBlendModeMultiply:
            return kCAFilterMultiplyBlendMode;
        case kCGBlendModeScreen:
            return kCAFilterScreenBlendMode;
        case kCGBlendModeOverlay:
            return kCAFilterOverlayBlendMode;
        case kCGBlendModeDarken:
            return kCAFilterDarkenBlendMode;
        case kCGBlendModeLighten:
            return kCAFilterLightenBlendMode;
        case kCGBlendModeColorDodge:
            return kCAFilterColorDodgeBlendMode;
        case kCGBlendModeColorBurn:
            return kCAFilterColorBurnBlendMode;
        case kCGBlendModeSoftLight:
            return kCAFilterSoftLightBlendMode;
        case kCGBlendModeHardLight:
            return kCAFilterHardLightBlendMode;
        case kCGBlendModeDifference:
            return kCAFilterDifferenceBlendMode;
        case kCGBlendModeExclusion:
            return kCAFilterExclusionBlendMode;
        case kCGBlendModeHue:
            return kCAFilterHueBlendMode;
        case kCGBlendModeSaturation:
            return kCAFilterSaturationBlendMode;
        case kCGBlendModeColor:
            return kCAFilterColorBlendMode;
        case kCGBlendModeLuminosity:
            return kCAFilterLuminosityBlendMode;
        case kCGBlendModeClear:
            return kCAFilterClear;
        case kCGBlendModeCopy:
            return kCAFilterCopy;
        case kCGBlendModeSourceIn:
            return kCAFilterSourceIn;
        case kCGBlendModeSourceOut:
            return kCAFilterSourceOut;
        case kCGBlendModeSourceAtop:
            return kCAFilterSourceAtop;
        case kCGBlendModeDestinationOver:
            return kCAFilterDestOver;
        case kCGBlendModeDestinationIn:
            return kCAFilterDestIn;
        case kCGBlendModeDestinationOut:
            return kCAFilterDestOut;
        case kCGBlendModeDestinationAtop:
            return kCAFilterDestAtop;
        case kCGBlendModeXOR:
            return kCAFilterXor;
        case kCGBlendModePlusDarker:
            if (compositingGroup) {
                return kCAFilterPlusD;
            } else {
                return kCAFilterPlusDIgnoreAlpha;
            }
        case kCGBlendModePlusLighter:
            if (compositingGroup) {
                return kCAFilterPlusL;
            } else {
                return kCAFilterPlusLIgnoreAlpha;
            }
        case kCGBlendModeLinearDodge:
            return kCAFilterLinearDodgeBlendMode;
        case kCGBlendModeLinearBurn:
            return kCAFilterLinearBurnBlendMode;
        case kCGBlendModeLinearLight:
            return kCAFilterLinearLightBlendMode;
        case kCGBlendModePinLight:
            return kCAFilterPinLightBlendMode;
        case kCGBlendModeSubtract:
            return kCAFilterSubtractBlendMode;
        case kCGBlendModeDivide:
            return kCAFilterDivideBlendMode;
        case kCGBlendModeMaximum:
            return kCAFilterMaximum;
        case kCGBlendModeSubtractS:
            return kCAFilterSubtractS;
        case kCGBlendModeSubtractD:
            return kCAFilterSubtractD;
        case kCGBlendModeDarkenSourceOver:
            return kCAFilterDarkenSourceOver;
        case kCGBlendModeLightenSourceOver:
            return kCAFilterLightenSourceOver;
        case kCGBlendModeMinimum:
            return kCAFilterMinimum;
        case kCGBlendModePlusLIgnoreAlpha:
            return kCAFilterPlusLIgnoreAlpha;
        case kCGBlendModePlusDIgnoreAlpha:
            return kCAFilterPlusDIgnoreAlpha;
        case kCGBlendModeSubtractSIgnoreAlpha:
            return kCAFilterSubtractSIgnoreAlpha;
        default:
            return nil;
    }
}
