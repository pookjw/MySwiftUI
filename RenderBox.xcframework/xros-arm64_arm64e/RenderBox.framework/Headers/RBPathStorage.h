#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN void RBPathStorageInit(void *, size_t, const void * _Nullable);
RB_EXTERN void RBPathStorageAppendElement(void *, RBPathElement, const void * _Nullable, const void * _Nullable);
RB_EXTERN void RBPathStorageAppendPath(void *, RBPath);
RB_EXTERN bool RBPathStorageIsEmpty(void *);
RB_EXTERN void RBPathStorageDestroy(void *);
RB_EXTERN bool RBPathStorageIsSingleElement(void *);
RB_EXTERN bool RBPathStorageApplyElements(void *, void *, bool (*)(void *, RBPathElement, const CGFloat *, const void * _Nullable));
RB_EXTERN CGRect RBPathStorageGetBoundingRect(void *);

NS_ASSUME_NONNULL_END
