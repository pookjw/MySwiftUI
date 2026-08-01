#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable REComponentClassFromType(REComponentType) NS_SWIFT_NAME(Component.ClassPtr.fromType(_:));
RE_EXTERN BOOL RENetworkMarkComponentDirty(REComponentRef) NS_SWIFT_NAME(Component.networkMarkComponentDirty(self:));
RE_EXTERN REEntityRef REComponentGetEntity(REComponentType) NS_SWIFT_NAME(getter:Component.entity(self:));
RE_EXTERN REComponentClassPtr _Nullable RECustomComponentTypeCreateWithIsTransient(const RECustomComponentTypeInfo *, BOOL) NS_SWIFT_NAME(Component.ClassPtr.createCustomComponentType(info:isTransient:));
RE_EXTERN REComponentClassPtr _Nullable RECustomComponentTypeCreate(const RECustomComponentTypeInfo *) NS_SWIFT_NAME(Component.ClassPtr.createCustomComponentType(info:));
RE_EXTERN void REComponentTypeSetCloneCallback(REComponentClassPtr, void * (* _Nullable)(void *)) NS_SWIFT_NAME(Component.ClassPtr.setCloneCallback(self:_:));
RE_EXTERN void RERegisterSwiftCodableComponent(const char *) NS_SWIFT_NAME(Component.registerSwiftCodableComponent(_:));

NS_ASSUME_NONNULL_END
