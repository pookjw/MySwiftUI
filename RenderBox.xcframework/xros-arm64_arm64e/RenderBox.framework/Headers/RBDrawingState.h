#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>

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

NS_ASSUME_NONNULL_END
