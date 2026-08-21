#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable REMeshComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.mesh());
RE_EXTERN REAssetRef _Nullable REMeshComponentGetMesh(REComponentRef) NS_SWIFT_NAME(getter:Component.meshComponent_mesh(self:));
RE_EXTERN void REMeshComponentSetMesh(REComponentRef, REAssetRef _Nullable) NS_SWIFT_NAME(setter:Component.meshComponent_mesh(self:_:));

NS_ASSUME_NONNULL_END
