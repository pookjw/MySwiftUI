#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN int32_t RECustomSystemPhysicsID(void);
RE_EXTERN int32_t RECustomSystemNetworkSendID(void);
RE_EXTERN int32_t RECustomSystemNetworkReceiveID(void);
RE_EXTERN int32_t RECustomSystemAnimationPlaybackID(void);
RE_EXTERN int32_t RECustomSkeletalPoseID(void);
RE_EXTERN int32_t RECustomSystemMeshDeformerID(void);
RE_EXTERN void RERegisterCustomSystem(int32_t, NSInteger, void * (^)(const void *, const void *), void (^)(void *, const void * _Nullable, const void *), const RESystemDependency *buffer, NSInteger count);

NS_ASSUME_NONNULL_END
