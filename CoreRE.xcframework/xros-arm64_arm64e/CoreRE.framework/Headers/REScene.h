#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEntity _Nullable RESceneFindEntity(REScene, REEntityID) NS_SWIFT_NAME(Scene.findEntity(self:id:));
RE_EXTERN void RESceneSetSwiftObject(REScene, void * _Nullable) NS_SWIFT_NAME(setter:Scene.swiftObject(self:_:));
RE_EXTERN void * _Nullable RESceneGetSwiftObject(REScene) NS_SWIFT_NAME(getter:Scene.swiftObject(self:));
RE_EXTERN bool RESceneIsFromActiveRealityRendererSceneGroup(REScene) NS_SWIFT_NAME(getter:Scene.isFromActiveRealityRendererSceneGroup(self:));
RE_EXTERN REEventBus RESceneGetEventBus(REScene) NS_SWIFT_NAME(getter:Scene.eventBus(self:));
RE_EXTERN void RESceneSetPhysicsDebugDrawLevel(REScene, REScenePhysicsDebugDrawLevel) NS_SWIFT_NAME(setter:Scene.physicsDebugDrawLevel(self:_:));
RE_EXTERN REScenePhysicsDebugDrawLevel RESceneGetPhysicsDebugDrawLevel(REScene) NS_SWIFT_NAME(getter:Scene.physicsDebugDrawLevel(self:));
RE_EXTERN void RESceneRemovePhysicsDebugComponent(REScene) NS_SWIFT_NAME(Scene.removePhysicsDebugComponent(self:));
RE_EXTERN REComponent _Nullable RESceneGetComponentsOfCustomType(REScene, REComponentClassPtr) NS_SWIFT_NAME(Scene.componentsOfCustomType(self:_:));
RE_EXTERN REECSManager _Nullable RESceneGetECSManagerNullable(REScene) NS_SWIFT_NAME(getter:Scene.ecsManager(self:));
RE_EXTERN REComponents RESceneGetComponentsOfClass(REScene) NS_SWIFT_NAME(getter:Scene.componentsOfClass(self:));

NS_ASSUME_NONNULL_END
