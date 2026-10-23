#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN void RBPathStorageInit(void *, size_t, const void * _Nullable);
RB_EXTERN void RBPathStorageAppendElement(void *, RBPathElement, const void * _Nullable, const void * _Nullable);
RB_EXTERN void RBPathStorageAppendPath(void *, RBPath);

NS_ASSUME_NONNULL_END
