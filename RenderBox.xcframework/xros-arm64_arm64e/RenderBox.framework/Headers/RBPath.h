#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN void RBPathStorageInit(void *, size_t, const void * _Nullable);
RB_EXTERN void RBPathRelease(RBPath);
RB_EXTERN void RBPathStorageAppendElement(void *, RBPathElement, const void * _Nullable, const void * _Nullable);
RB_EXTERN bool RBPathIsEmpty(RBPath);

RB_EXTERN const RBPathCallbacks RBPathCGPathCallbacks;

NS_ASSUME_NONNULL_END
