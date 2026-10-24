#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN void RBPathRelease(RBPath) NS_SWIFT_NAME(RBPath.release(self:));
RB_EXTERN RBPath RBPathRetain(RBPath) NS_SWIFT_NAME(RBPath.retain(self:));
RB_EXTERN bool RBPathIsEmpty(RBPath) NS_SWIFT_NAME(getter:RBPath.isEmpty(self:));
RB_EXTERN RBPath RBPathMakeRect(const void * _Nullable, CGRect) NS_SWIFT_NAME(RBPath.makeRect(_:rect:));
RB_EXTERN RBPath RBPathMakeEllipse(const void * _Nullable, CGRect) NS_SWIFT_NAME(RBPath.makeEllipse(_:rect:));
RB_EXTERN RBPath RBPathMakeRoundedRect(RBPathRoundedCornerStyle cornerStyle, const void * _Nullable, CGRect, CGSize) NS_SWIFT_NAME(RBPath.makeRoundedRect(cornerStyle:_:rect:cornerSize:));
RB_EXTERN bool RBPathApplyShape(RBPath, bool, void *, void (*)(void *, RBPathShapeType, const RBPathShape *)) NS_SWIFT_NAME(RBPath.applyShape(self:_:_:_:));
RB_EXTERN CGRect RBPathGetBoundingRect(RBPath) NS_SWIFT_NAME(getter:RBPath.boundingRect(self:));
RB_EXTERN CGPathRef RBPathCopyCGPath(RBPath) NS_SWIFT_NAME(getter:RBPath.cgPath(self:)) CF_RETURNS_RETAINED;

RB_EXTERN const RBPathCallbacks RBPathCGPathCallbacks NS_SWIFT_NAME(RBPathCallbacks.cgPath);
RB_EXTERN const RBPath RBPathEmpty NS_SWIFT_NAME(RBPath.empty);

NS_ASSUME_NONNULL_END
