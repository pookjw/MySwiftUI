#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable REComponentClassFromType(REComponentType) NS_SWIFT_NAME(Component.ClassPtr.fromType(_:));
RE_EXTERN BOOL RENetworkMarkComponentDirty(REComponentRef) NS_SWIFT_NAME(Component.networkMarkComponentDirty(self:));
RE_EXTERN REEntityRef REComponentGetEntity(REComponentRef) NS_SWIFT_NAME(getter:Component.entity(self:));
RE_EXTERN REComponentClassPtr _Nullable RECustomComponentTypeCreateWithIsTransient(const RECustomComponentTypeInfo *, BOOL) NS_SWIFT_NAME(Component.ClassPtr.createCustomComponentType(_:isTransient:));
RE_EXTERN REComponentClassPtr _Nullable RECustomComponentTypeCreate(const RECustomComponentTypeInfo *) NS_SWIFT_NAME(Component.ClassPtr.createCustomComponentType(_:));
RE_EXTERN void REComponentTypeSetCloneCallback(REComponentClassPtr, void * (* _Nullable)(void *)) NS_SWIFT_NAME(Component.ClassPtr.setCloneCallback(self:_:));
RE_EXTERN void RERegisterSwiftCodableComponent(const char *) NS_SWIFT_NAME(Component.registerSwiftCodableComponent(_:));
RE_EXTERN uint64_t REEntityGetLocalId(REEntityRef) NS_SWIFT_NAME(getter:Component.localId(self:));
RE_EXTERN void * _Nullable RECustomComponentGetObject(REComponentRef) NS_SWIFT_NAME(getter:Component.customComponentObject(self:));
NS_ASSUME_NONNULL_END
