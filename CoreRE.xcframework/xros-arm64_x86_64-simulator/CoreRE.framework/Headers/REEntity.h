#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN RESceneRef _Nullable REEntityGetSceneNullable(REEntityRef) NS_SWIFT_NAME(getter:Entity.scene(self:));
RE_EXTERN REComponentRef REEntityGetOrAddComponentByClass(REEntityRef, REComponentTypeRef) NS_SWIFT_NAME(Entity.getOrAddComponent(self:ofType:));
RE_EXTERN REComponentRef _Nullable REEntityGetComponentByClass(REEntityRef, REComponentTypeRef) NS_SWIFT_NAME(Entity.getComponent(self:ofType:));
RE_EXTERN void REHideEntity(REEntityRef) NS_SWIFT_NAME(Entity.hide(self:));
RE_EXTERN void REEntitySetSwiftObject(REEntityRef, void * _Nullable) NS_SWIFT_NAME(setter:Entity.swiftObject(self:_:));
RE_EXTERN void * _Nullable REEntityGetSwiftObject(REEntityRef) NS_SWIFT_NAME(getter:Entity.swiftObject(self:));
RE_EXTERN REEntityRef REEntityCreate(void) NS_SWIFT_NAME(Entity.init());

NS_ASSUME_NONNULL_END
