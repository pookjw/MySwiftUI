#ifndef RB_Defines_h
#define RB_Defines_h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


#ifdef __cplusplus
#define RB_EXTERN       extern "C"
#else
#define RB_EXTERN           extern
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(uint32_t, RBPathElement) {
    RBPathElementUnknown0 = 0,
    RBPathElementUnknown1 = 1,
    RBPathElementUnknown2 = 2,
    RBPathElementUnknown3 = 3,
    RBPathElementUnknown4 = 4,
    RBPathElementUnknown5 = 5,
    RBPathElementUnknown7 = 7,
    RBPathElementUnknown8 = 8,
    RBPathElementUnknown9 = 9,
    RBPathElementUnknown16 = 16,
    RBPathElementUnknown19 = 19
};

typedef struct RBPathCallbacks {;
    const void * _Nullable unknown0;
    const void * _Nonnull (* _Nullable unknown1)(const void *);
    void (* _Nullable unknown2)(const void *);
    bool (* _Nullable unknown3)(const void *, void *, bool (*)(void *, RBPathElement, const CGFloat *, const void * _Nullable));
    bool (* _Nullable unknown4)(const void *, const void *);
    bool (* _Nullable unknown5)(const void *);
    bool (* _Nullable unknown6)(const void *);
    NSInteger (* _Nullable unknown7)(const void *);
    CGRect (* _Nullable unknown8)(const void *);
    const void * _Nullable unknown9;
    const void * _Nullable unknown10;
} RBPathCallbacks;

typedef struct RBPath {
    const void * _Nullable unknown0;
    const RBPathCallbacks * _Nullable callbacks;
} RBPath;

typedef struct RBPathStrokeStyle {
    const CGFloat lineWidth;
    const CGFloat miterLimit;
    const CGFloat dashPhase;
} RBPathStrokeStyle;

typedef struct RBPathStrokeDashes {
    const CGLineCap lineCap;
    const CGLineJoin lineJoin;
    const size_t count;
    const CGFloat *values;
} RBPathStrokeDashes;

typedef struct RBPathRoundedRect {
    const CGRect rect;
    const CGSize cornerSize;
} RBPathRoundedRect;

typedef NS_ENUM(uint32_t, RBPathRoundedCornerStyle) {
    RBPathRoundedCornerStyleCircular = 0,
    RBPathRoundedCornerStyleContinuous = 1
};

typedef NS_ENUM(uint32_t, RBPathShapeType) {
    RBPathShapeTypeUnknown0 = 0,
    RBPathShapeTypeUnknown1 = 1,
    RBPathShapeTypeUnknown2 = 2,
    RBPathShapeTypeUnknown3 = 3,
    RBPathShapeTypeUnknown6 = 6,
    RBPathShapeTypeUnknown8 = 8
};

typedef struct RBPathShapeUnknown0 {
    const CGAffineTransform transform;
    const CGRect rect;
} RBPathShapeUnknown0;

typedef struct RBPathShapeUnknown1 {
    const CGAffineTransform transform;
    const CGRect rect;
} RBPathShapeUnknown1;

typedef struct RBPathShapeUnknown3 {
    const CGAffineTransform transform;
    const CGRect rect;
    const CGSize cornerSize;
    const RBPathRoundedCornerStyle cornerStyle;
} RBPathShapeUnknown3;

typedef struct RBPathShapeUnknown6 {
    const RBPath path;
    const CGFloat lineWidth;
    const CGLineCap lineCap;
    const CGLineJoin lineJoin;
    const CGFloat miterLimit;
    const CGFloat dashPhase;
    const NSInteger count;
    const CGFloat *dash;
} RBPathShapeUnknown6;

typedef union RBPathShape {
    const RBPathShapeUnknown0 unknown0;
    const RBPathShapeUnknown1 unknown1;
    const RBPathShapeUnknown3 unknown3;
    const RBPathShapeUnknown6 unknown6;
    // TODO
} RBPathShape;

typedef NS_ENUM(int32_t, RBColorMode) {
    RBColorModeInvalid = -1
};

typedef NS_ENUM(int32_t, RBColorSpace) {
    RBColorSpaceUnknown0 = 0,
    RBColorSpaceUnknown1 = 1,
    RBColorSpaceUnknown2 = 2
};

typedef NS_ENUM(int32_t, RBBlendMode) {
    RBBlendModeUnknown0 = 0
};

typedef NS_ENUM(uint32_t, RBDisplayListContentsProfile) {
    RBDisplayListContentsProfileUnknown0 = 0,
    RBDisplayListContentsProfileUnknown1 = 1
};

typedef struct RBColor {
    const float red;
    const float green;
    const float blue;
    const float alpha;
} RBColor;

typedef NS_ENUM(uint32_t, RBRenderingMode) {
    RBRenderingModeUnknown0 = 0,
    RBRenderingModeUnknown1 = 1,
    RBRenderingModeUnknown2 = 2,
    RBRenderingModeUnknown3 = 3
};

typedef NS_OPTIONS(unsigned int, RBGradientFlags) {
    RBGradientFlagsNone = 0,
    RBGradientFlagsUnknown6 = (1 << 6),
    RBGradientFlagsUnknown7 = (1 << 7),
    RBGradientFlagsUnknown9 = (1 << 9)
};

typedef NS_OPTIONS(unsigned int, RBBlurFlags) {
    RBBlurFlagsNone = 0,
    RBBlurFlagsUnknown0 = (1 << 0),
    RBBlurFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBPathProjectionFlags) {
    RBPathProjectionFlagsNone = 0
};

typedef NS_OPTIONS(unsigned int, RBShaderFlags) {
    RBShaderFlagsNone = 0,
    RBShaderFlagsUnknown0 = (1 << 0)
};

typedef NS_OPTIONS(unsigned int, RBShaderFillFlags) {
    RBShaderFillFlagsNone = 0
};

typedef NS_ENUM(unsigned int, RBMeshGradientType) {
    RBMeshGradientTypeUnknown1 = 1,
    RBMeshGradientTypeUnknown2 = 2
};

typedef NS_OPTIONS(unsigned int, RBMeshGradientFlags) {
    RBMeshGradientFlagsNone = 0,
    RBMeshGradientFlagsUnknown0 = (1 << 0),
    RBMeshGradientFlagsUnknown1 = (1 << 1),
    RBMeshGradientFlagsUnknown4 = (1 << 4)
};

typedef NS_OPTIONS(unsigned int, RBShadowFlags) {
    RBShadowFlagsNone = 0,
    RBShadowFlagsUnknown0 = (1 << 0),
    RBShadowFlagsUnknown1 = (1 << 1),
    RBShadowFlagsUnknown2 = (1 << 2),
    RBShadowFlagsUnknown3 = (1 << 3),
    RBShadowFlagsUnknown4 = (1 << 4),
    RBShadowFlagsUnknown5 = (1 << 5)
};

typedef const void * RBDrawingState __attribute__((swift_wrapper(struct)));

typedef struct RBCornerRadii {
    const CGFloat topLeft;
    const CGFloat topRight;
    const CGFloat bottomLeft;
    const CGFloat bottomRight;
} RBCornerRadii;

typedef struct RBDisplayListColorMultiply {
    const RBColor color;
    const RBColorSpace colorSpace;
    const float headroom;
    const uint32_t unknown0;
} RBDisplayListColorMultiply;

typedef NS_ENUM(unsigned int, RBDisplayListStyle) {
    RBDisplayListStyleUnknown0 = 0,
    RBDisplayListStyleUnknown1 = 1,
    RBDisplayListStyleUnknown5 = 5,
    RBDisplayListStyleUnknown6 = 6,
    RBDisplayListStyleUnknown7 = 7
};

typedef struct RBColorStyleAlphaMultiply {
    const RBColor color;
    const RBColorSpace colorSpace;
    const float headroom;
    const uint32_t unknown0;
} RBColorStyleAlphaMultiply;

typedef NS_OPTIONS(unsigned int, RBColorMatrixFlags) {
    RBColorMatrixFlagsNone = 0,
    RBColorMatrixFlagsUnknown0 = (1 << 0),
    RBColorMatrixFlagsUnknown1 = (1 << 1),
    RBColorMatrixFlagsUnknown2 = (1 << 2)
};

typedef struct RBColorMatrixFilter {
    const float m11, m12, m13, m14, m15;
    const float m21, m22, m23, m24, m25;
    const float m31, m32, m33, m34, m35;
    const float m41, m42, m43, m44, m45;
} RBColorMatrixFilter;

typedef NS_OPTIONS(unsigned int, RBHueRotationFlags) {
    RBHueRotationFlagsNone = 0,
    RBHueRotationFlagsUnknown0 = (1 << 0),
    RBHueRotationFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBSaturationFlags) {
    RBSaturationFlagsNone = 0,
    RBSaturationFlagsUnknown0 = (1 << 0),
    RBSaturationFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBBrightnessFlags) {
    RBBrightnessFlagsNone = 0,
    RBBrightnessFlagsUnknown0 = (1 << 0),
    RBBrightnessFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBContrastFlags) {
    RBContrastFlagsNone = 0,
    RBContrastFlagsUnknown0 = (1 << 0),
    RBContrastFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBColorInvertFlags) {
    RBColorInvertFlagsNone = 0,
    RBColorInvertFlagsUnknown0 = (1 << 0),
    RBColorInvertFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBGrayscaleFlags) {
    RBGrayscaleFlagsNone = 0,
    RBGrayscaleFlagsUnknown0 = (1 << 0),
    RBGrayscaleFlagsUnknown1 = (1 << 1)
};

typedef struct RBAlphaThresholdEffect {
    const uint8_t unknown0;
    const float unknown1;
    const float unknown2;
    const RBColor color;
    const RBColorSpace colorSpace;
    const float headroom;
} RBAlphaThresholdEffect;

typedef struct RBAlphaGradientEffect {
    const uint8_t unknown0;
    const float lowerBound;
    const float upperBound;
    const NSInteger count;
    const RBColor *colors;
    const RBColorSpace colorSpace;
    const float headroom;
    const CGFloat * _Nullable locations;
    const RBGradientFlags flags;
} RBAlphaGradientEffect;

typedef NS_OPTIONS(unsigned int, RBShaderFilterFlags) {
    RBShaderFilterFlagsNone = 0
};

typedef struct RBDisplayListColorMonochrome {
    const float amount;
    const float bias;
    const RBColor color;
    const RBColorSpace colorSpace;
    const float headroom;
    const uint32_t unknown0;
} RBDisplayListColorMonochrome;

typedef NS_OPTIONS(unsigned int, RBLuminanceCurveFlags) {
    RBLuminanceCurveFlagsNone = 0,
    RBLuminanceCurveFlagsUnknown0 = (1 << 0),
    RBLuminanceCurveFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBRCurvesFlags) {
    RBRCurvesFlagsNone = 0,
    RBRCurvesFlagsUnknown0 = (1 << 0),
    RBRCurvesFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBLuminanceToAlphaFlags) {
    RBLuminanceToAlphaFlagsNone = 0,
    RBLuminanceToAlphaFlagsUnknown0 = (1 << 0),
    RBLuminanceToAlphaFlagsUnknown1 = (1 << 1)
};

typedef NS_OPTIONS(unsigned int, RBLayerFlags) {
    RBLayerFlagsNone = 0,
    RBLayerFlagsUnknown0 = (1 << 0),
    RBLayerFlagsUnknown5 = (1 << 5)
};

typedef NS_OPTIONS(uint32_t, RBClipFlags) {
    RBClipFlagsNone = 0,
    RBClipFlagsUnknown0 = (1 << 0)
};

typedef NS_OPTIONS(unsigned int, RBCGContextFlags) {
    RBCGContextFlagsNone = 0
};

NS_ASSUME_NONNULL_END

#endif
