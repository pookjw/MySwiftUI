#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REScene _Nullable REEntityGetSceneNullable(REEntity) NS_SWIFT_NAME(getter:Entity.scene(self:));
RE_EXTERN REComponent REEntityGetOrAddComponentByClass(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.getOrAddComponent(self:ofType:));
RE_EXTERN REComponent REEntityGetOrAddCustomComponent(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.getOrAddCustomComponent(self:_:));
RE_EXTERN REComponent _Nullable REEntityAddComponentNoEvents(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.addComponentNoEvents(self:ofType:));
RE_EXTERN REComponent _Nullable REEntityGetComponentByClass(REEntity, REComponentClassPtr _Nullable) NS_SWIFT_NAME(Entity.getComponent(self:ofType:));
RE_EXTERN void REEntityRemoveComponentByClass(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.removeComponent(self:ofType:));
RE_EXTERN void REHideEntity(REEntity) NS_SWIFT_NAME(Entity.hide(self:));
RE_EXTERN void REEntitySetSwiftObject(REEntity, void * _Nullable) NS_SWIFT_NAME(setter:Entity.swiftObject(self:_:));
RE_EXTERN void * _Nullable REEntityGetSwiftObject(REEntity) NS_SWIFT_NAME(getter:Entity.swiftObject(self:));
RE_EXTERN REEntity REEntityCreate(void) NS_SWIFT_NAME(Entity.init());
RE_EXTERN REComponent REEntityGetOrAddComponent(REEntity, REComponentType) NS_SWIFT_NAME(Entity.getOrAddComponent(self:ofType:));
RE_EXTERN void REEntitySendAddAndActivateComponentEvents(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.sendAddAndActivateComponentEvents(self:ofType:));
RE_EXTERN void * _Nullable REEntityGetObservationRegistrar(REEntity) NS_SWIFT_NAME(getter:Entity.observationRegistrar(self:));
RE_EXTERN bool REEntityIsBeingDestroyed(REEntity) NS_SWIFT_NAME(getter:Entity.isBeingDestroyed(self:));
RE_EXTERN bool REEntityIsNonHiddenAndInHierarchy(REEntity, REEntity _Nullable) NS_SWIFT_NAME(Entity.isNonHiddenAndInHierarchy(self:_:));
RE_EXTERN REComponent _Nullable REEntityAddComponentByClass(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.addComponent(self:ofType:));
RE_EXTERN REEntity _Nullable REEntityGetParent(REEntity) NS_SWIFT_NAME(getter:Entity.parent(self:));
RE_EXTERN void REEntitySetParent(REEntity, REEntity _Nullable) NS_SWIFT_NAME(setter:Entity.parent(self:_:));
RE_EXTERN REComponent _Nullable REEntityGetCustomComponent(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.customComponent(self:_:));
RE_EXTERN NSInteger REEntityGetChildCount(REEntity) NS_SWIFT_NAME(getter:Entity.childCount(self:));
RE_EXTERN REEntity _Nullable REEntityGetChild(REEntity, NSInteger) NS_SWIFT_NAME(Entity.child(self:_:));
RE_EXTERN void REEntityRemoveCustomComponent(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.removeCustomComponent(self:_:));
RE_EXTERN REComponent _Nullable REEntityAddCustomComponent(REEntity, REComponentClassPtr) NS_SWIFT_NAME(Entity.addCustomComponent(self:_:));
RE_EXTERN void REEntitySetName(REEntity, const char * _Nullable) NS_SWIFT_NAME(setter:Entity.name(self:_:));
RE_EXTERN const char * _Nullable REEntityGetName(REEntity) NS_SWIFT_NAME(getter:Entity.name(self:));

NS_ASSUME_NONNULL_END
