#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN RESceneRef _Nullable REEntityGetSceneNullable(REEntityRef) NS_SWIFT_NAME(getter:Entity.scene(self:));
RE_EXTERN REComponentRef REEntityGetOrAddComponentByClass(REEntityRef, REComponentTypeRef) NS_SWIFT_NAME(Entity.getOrAddComponent(self:ofType:));

NS_ASSUME_NONNULL_END
