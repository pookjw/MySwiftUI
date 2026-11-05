#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/RBShader.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN void RBDrawingStateTranslateCTM(RBDrawingState, CGFloat tx, CGFloat ty) NS_SWIFT_NAME(RBDrawingState.translateCTM(self:tx:ty:));
RB_EXTERN RBDrawingState RBDrawingStateInit(RBDrawingState)  NS_SWIFT_NAME(RBDrawingState.initialize(_:));
RB_EXTERN RBColorSpace RBDrawingStateGetDefaultColorSpace(RBDrawingState) NS_SWIFT_NAME(getter:RBDrawingState.defaultColorSpace(self:));
RB_EXTERN RBDisplayList * RBDrawingStateGetDisplayList(RBDrawingState) NS_SWIFT_NAME(getter:RBDrawingState.displayList(self:));
RB_EXTERN void RBDrawingStateScaleCTM(RBDrawingState, CGFloat sx, CGFloat sy) NS_SWIFT_NAME(RBDrawingState.scaleCTM(self:sx:sy:));
RB_EXTERN void RBDrawingStateDrawShape(RBDrawingState, RBShape *, RBFill *, RBBlendMode, float) NS_SWIFT_NAME(RBDrawingState.drawShape(self:shape:fill:blendMode:opacity:));
RB_EXTERN void RBDrawingStateClipShape(RBDrawingState, RBShape *, RBRenderingMode) NS_SWIFT_NAME(RBDrawingState.clipShape(self:_:renderingMode:));
RB_EXTERN RBDrawingState RBDrawingStateBeginLayer(RBDrawingState, uint32_t) NS_SWIFT_NAME(RBDrawingState.beginLayer(self:_:));
RB_EXTERN void RBDrawingStateDrawLayer(RBDrawingState, RBDrawingState, RBBlendMode, float) NS_SWIFT_NAME(RBDrawingState.drawLayer(self:_:blendMode:opacity:));
RB_EXTERN void RBDrawingStateDestroy(RBDrawingState) NS_SWIFT_NAME(RBDrawingState.destroy(self:));
RB_EXTERN void RBDrawingStateRotateCTM(RBDrawingState, CGFloat angle) NS_SWIFT_NAME(RBDrawingState.rotateCTM(self:angle:));
RB_EXTERN void RBDrawingStateAddShadowStyle(RBDrawingState, RBBlendMode, RBShadowFlags, CGFloat, CGSize, RBColor) NS_SWIFT_NAME(RBDrawingState.addShadowStyle(self:blendMode:flags:radius:offset:color:));
RB_EXTERN void RBDrawingStateAddRotationStyle(RBDrawingState, CGFloat angle, CGPoint anchor) NS_SWIFT_NAME(RBDrawingState.addRotationStyle(self:angle:anchor:));
RB_EXTERN void RBDrawingStateAddRotation3DStyle(RBDrawingState, CGFloat angle, float axisX, float axisY, float axisZ, float anchorX, float anchorY, float anchorZ, CGFloat perspective, CGFloat flipWidth) NS_SWIFT_NAME(RBDrawingState.addRotation3DStyle(self:angle:axisX:axisY:axisZ:anchorX:anchorY:anchorZ:perspective:flipWidth:));
RB_EXTERN void RBDrawingStateAddShadowStyle3(RBDrawingState, uint32_t, RBBlendMode blendmode, RBShadowFlags flags, CGFloat radius, float midpoint, CGSize offset, RBColor color) NS_SWIFT_NAME(RBDrawingState.addShadowStyle3(self:_:blendMode:flags:radius:midpoint:offset:color:));
RB_EXTERN void RBDrawingStateAddPathProjectionStyle(RBDrawingState, RBPath, CGAffineTransform, RBPathProjectionFlags, CGPoint, CGPoint) NS_SWIFT_NAME(RBDrawingState.addPathProjectionStyle(self:path:transform:flags:startPoint:endPoint:));
RB_EXTERN void RBDrawingStateAddStyle(RBDrawingState, RBDisplayListStyle, const void *data) NS_SWIFT_NAME(RBDrawingState.addStyle(self:style:data:));
RB_EXTERN void RBDrawingStateAddColorMatrixFilter(RBDrawingState, const RBColorMatrixFilter *, RBColorMatrixFlags) NS_SWIFT_NAME(RBDrawingState.addColorMatrixFilter(self:matrix:flags:));
RB_EXTERN void RBDrawingStateAddHueRotationFilter(RBDrawingState, RBHueRotationFlags flags, CGFloat angle) NS_SWIFT_NAME(RBDrawingState.addHueRotationFilter(self:flags:angle:));
RB_EXTERN void RBDrawingStateAddSaturationFilter(RBDrawingState, RBSaturationFlags flags, float amount) NS_SWIFT_NAME(RBDrawingState.addSaturationFilter(self:flags:amount:));
RB_EXTERN void RBDrawingStateAddBrightnessFilter(RBDrawingState, RBBrightnessFlags flags, float amount) NS_SWIFT_NAME(RBDrawingState.addBrightnessFilter(self:flags:amount:));
RB_EXTERN void RBDrawingStateAddContrastFilter(RBDrawingState, RBContrastFlags flags, float amount) NS_SWIFT_NAME(RBDrawingState.addContrastFilter(self:flags:amount:));
RB_EXTERN void RBDrawingStateAddColorInvertFilter(RBDrawingState, RBColorInvertFlags flags, float amount) NS_SWIFT_NAME(RBDrawingState.addColorInvertFilter(self:flags:amount:));
RB_EXTERN void RBDrawingStateAddGrayscaleFilter(RBDrawingState, RBGrayscaleFlags flags, float amount) NS_SWIFT_NAME(RBDrawingState.addGrayscaleFilter(self:flags:amount:));
RB_EXTERN void RBDrawingStateAddBlurFilter(RBDrawingState, RBBlurFlags flags, CGFloat radius, CGFloat, CGFloat, CGFloat, CGFloat) NS_SWIFT_NAME(RBDrawingState.addBlurFilter(self:flags:radius:_:_:_:_:));
RB_EXTERN void RBDrawingStateAddLuminanceCurveFilter(RBDrawingState, const float *curve, RBLuminanceCurveFlags flags, float, float, float, float) NS_SWIFT_NAME(RBDrawingState.addLuminanceCurveFilter(self:curve:flags:_:_:_:_:));
RB_EXTERN void RBDrawingStateAddRGBACurvesFilter(RBDrawingState, const float *curves, RBRCurvesFlags flags) NS_SWIFT_NAME(RBDrawingState.addRGBACurvesFilter(self:curves:flags:));
RB_EXTERN void RBDrawingStateAddLuminanceToAlphaFilter(RBDrawingState, RBLuminanceToAlphaFlags flags) NS_SWIFT_NAME(RBDrawingState.addLuminanceToAlphaFilter(self:flags:));
RB_EXTERN void RBDrawingStateAddShaderFilter(RBDrawingState, RBShader *, const CGRect * _Nullable, RBShaderFilterFlags, CGSize) NS_SWIFT_NAME(RBDrawingState.addShaderFilter(self:shader:rect:filterFlags:size:));

NS_ASSUME_NONNULL_END
