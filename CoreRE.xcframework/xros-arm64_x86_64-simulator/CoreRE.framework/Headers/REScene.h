#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEntityRef _Nullable RESceneFindEntity(RESceneRef, REEntityID) NS_SWIFT_NAME(Scene.findEntity(self:id:));
RE_EXTERN void RESceneSetSwiftObject(RESceneRef, void * _Nullable) NS_SWIFT_NAME(setter:Scene.swiftObject(self:_:));
RE_EXTERN void * _Nullable RESceneGetSwiftObject(RESceneRef) NS_SWIFT_NAME(getter:Scene.swiftObject(self:));
RE_EXTERN bool RESceneIsFromActiveRealityRendererSceneGroup(RESceneRef) NS_SWIFT_NAME(getter:Scene.isFromActiveRealityRendererSceneGroup(self:));

NS_ASSUME_NONNULL_END
