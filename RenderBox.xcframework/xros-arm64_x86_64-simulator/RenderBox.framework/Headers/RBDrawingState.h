#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN void RBDrawingStateTranslateCTM(RBDrawingState, CGFloat tx, CGFloat ty) NS_SWIFT_NAME(RBDrawingState.translateCTM(self:tx:ty:));
RB_EXTERN RBDrawingState RBDrawingStateInit(RBDrawingState)  NS_SWIFT_NAME(RBDrawingState.initialize(_:));
RB_EXTERN RBColorSpace RBDrawingStateGetDefaultColorSpace(RBDrawingState) NS_SWIFT_NAME(getter:RBDrawingState.defaultColorSpace(self:));
RB_EXTERN RBDisplayList * RBDrawingStateGetDisplayList(RBDrawingState) NS_SWIFT_NAME(getter:RBDrawingState.displayList(self:));
RB_EXTERN void RBDrawingStateScaleCTM(RBDrawingState, CGFloat sx, CGFloat sy) NS_SWIFT_NAME(RBDrawingState.scaleCTM(self:sx:sy:));

NS_ASSUME_NONNULL_END
