#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN int32_t RECustomSystemPhysicsID(void);
RE_EXTERN int32_t RECustomSystemNetworkSendID(void);
RE_EXTERN int32_t RECustomSystemNetworkReceiveID(void);
RE_EXTERN int32_t RECustomSystemAnimationPlaybackID(void);
RE_EXTERN int32_t RECustomSkeletalPoseID(void);
RE_EXTERN int32_t RECustomSystemMeshDeformerID(void);
RE_EXTERN void RERegisterCustomSystem(int32_t, NSInteger, void * (^)(const void *, const void *), void (^)(void *, const void * _Nullable, const void *), const RESystemDependency *buffer, NSInteger count);
RE_EXTERN void RECustomSystemSetScheduleTypeForScene(RECustomSystemRef, RESceneRef, RECustomSystemScheduleType) NS_SWIFT_NAME(CustomSystem.setScheduleTypeForScene(self:_:_:));
RE_EXTERN float RECustomSystemUpdateContextGetDeltaTime(RECustomSystemUpdateContextRef) NS_SWIFT_NAME(getter:CustomSystem.UpdateContext.deltaTime(self:));
RE_EXTERN bool RECustomSystemUpdateContextGetSystemsArePausedInEditor(RECustomSystemUpdateContextRef) NS_SWIFT_NAME(getter:CustomSystem.UpdateContext.systemsArePausedInEditor(self:));
RE_EXTERN void RECustomSystemEnqueueUpdateWithDeadlineForScene(RECustomSystemRef, RESceneRef, float) NS_SWIFT_NAME(CustomSystem.enqueueUpdateWithDeadlineForScene(self:_:_:));

NS_ASSUME_NONNULL_END
