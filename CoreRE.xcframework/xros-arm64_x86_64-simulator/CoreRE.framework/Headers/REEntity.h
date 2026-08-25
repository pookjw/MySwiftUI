#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN RESceneRef _Nullable REEntityGetSceneNullable(REEntityRef) NS_SWIFT_NAME(getter:Entity.scene(self:));
RE_EXTERN REComponentRef REEntityGetOrAddComponentByClass(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.getOrAddComponent(self:ofType:));
RE_EXTERN REComponentRef REEntityGetOrAddCustomComponent(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.getOrAddCustomComponent(self:_:));
RE_EXTERN REComponentRef _Nullable REEntityAddComponentNoEvents(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.addComponentNoEvents(self:ofType:));
RE_EXTERN REComponentRef _Nullable REEntityGetComponentByClass(REEntityRef, REComponentClassPtr _Nullable) NS_SWIFT_NAME(Entity.getComponent(self:ofType:));
RE_EXTERN void REEntityRemoveComponentByClass(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.removeComponent(self:ofType:));
RE_EXTERN void REHideEntity(REEntityRef) NS_SWIFT_NAME(Entity.hide(self:));
RE_EXTERN void REEntitySetSwiftObject(REEntityRef, void * _Nullable) NS_SWIFT_NAME(setter:Entity.swiftObject(self:_:));
RE_EXTERN void * _Nullable REEntityGetSwiftObject(REEntityRef) NS_SWIFT_NAME(getter:Entity.swiftObject(self:));
RE_EXTERN REEntityRef REEntityCreate(void) NS_SWIFT_NAME(Entity.init());
RE_EXTERN REComponentRef REEntityGetOrAddComponent(REEntityRef, REComponentType) NS_SWIFT_NAME(Entity.getOrAddComponent(self:ofType:));
RE_EXTERN void REEntitySendAddAndActivateComponentEvents(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.sendAddAndActivateComponentEvents(self:ofType:));
RE_EXTERN void * _Nullable REEntityGetObservationRegistrar(REEntityRef) NS_SWIFT_NAME(getter:Entity.observationRegistrar(self:));
RE_EXTERN bool REEntityIsBeingDestroyed(REEntityRef) NS_SWIFT_NAME(getter:Entity.isBeingDestroyed(self:));
RE_EXTERN bool REEntityIsNonHiddenAndInHierarchy(REEntityRef, REEntityRef _Nullable) NS_SWIFT_NAME(Entity.isNonHiddenAndInHierarchy(self:_:));
RE_EXTERN REComponentRef _Nullable REEntityAddComponentByClass(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.addComponent(self:ofType:));
RE_EXTERN REEntityRef _Nullable REEntityGetParent(REEntityRef) NS_SWIFT_NAME(getter:Entity.parent(self:));
RE_EXTERN void REEntitySetParent(REEntityRef, REEntityRef _Nullable) NS_SWIFT_NAME(setter:Entity.parent(self:_:));
RE_EXTERN REComponentRef _Nullable REEntityGetCustomComponent(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.customComponent(self:_:));
RE_EXTERN NSInteger REEntityGetChildCount(REEntityRef) NS_SWIFT_NAME(getter:Entity.childCount(self:));
RE_EXTERN REEntityRef _Nullable REEntityGetChild(REEntityRef, NSInteger) NS_SWIFT_NAME(Entity.child(self:_:));
RE_EXTERN void REEntityRemoveCustomComponent(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.removeCustomComponent(self:_:));
RE_EXTERN REComponentRef _Nullable REEntityAddCustomComponent(REEntityRef, REComponentClassPtr) NS_SWIFT_NAME(Entity.addCustomComponent(self:_:));
RE_EXTERN void REEntitySetName(REEntityRef, const char * _Nullable) NS_SWIFT_NAME(setter:Entity.name(self:_:));
RE_EXTERN const char * _Nullable REEntityGetName(REEntityRef) NS_SWIFT_NAME(getter:Entity.name(self:));

NS_ASSUME_NONNULL_END
