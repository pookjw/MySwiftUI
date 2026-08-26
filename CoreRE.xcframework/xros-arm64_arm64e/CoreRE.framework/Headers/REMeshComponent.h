#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable REMeshComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.mesh());
RE_EXTERN REAsset _Nullable REMeshComponentGetMesh(REComponent) NS_SWIFT_NAME(getter:Component.meshComponent_mesh(self:));
RE_EXTERN void REMeshComponentSetMesh(REComponent, REAsset _Nullable) NS_SWIFT_NAME(setter:Component.meshComponent_mesh(self:_:));
RE_EXTERN float REMeshComponentGetBoundsMargin(REComponent) NS_SWIFT_NAME(getter:Component.meshComponent_boundsMargin(self:));
RE_EXTERN void REMeshComponentSetBoundsMargin(REComponent, float) NS_SWIFT_NAME(setter:Component.meshComponent_boundsMargin(self:_:));
RE_EXTERN NSInteger REMeshComponentGetMaterialCount(REComponent) NS_SWIFT_NAME(getter:Component.meshComponent_materialCount(self:));
RE_EXTERN void REMeshComponentRemoveAllMaterials(REComponent) NS_SWIFT_NAME(Component.meshComponent_removeAllMaterials(self:));
RE_EXTERN void REMeshComponentAddMaterialWithParameters(REComponent, REAsset, REEntity _Nullable) NS_SWIFT_NAME(Component.meshComponent_addMaterialWithParameters(self:_:_:));
RE_EXTERN void REMeshComponentAddMaterial(REComponent, REAsset) NS_SWIFT_NAME(Component.meshComponent_addMaterial(self:_:));
RE_EXTERN REAsset _Nullable REMeshComponentGetMaterialAtIndex(REComponent, NSInteger) NS_SWIFT_NAME(Component.meshComponent_materialAtIndex(self:_:));
RE_EXTERN void REMeshComponentSetMaterialWithParametersAtIndex(REComponent, NSInteger, REAsset, REEntity _Nullable) NS_SWIFT_NAME(Component.meshComponent_setMaterialWithParametersAtIndex(self:_:_:_:));
RE_EXTERN void REMeshComponentSetMaterialAtIndex(REComponent, NSInteger, REAsset) NS_SWIFT_NAME(Component.meshComponent_setMaterialAtIndex(self:_:_:));

NS_ASSUME_NONNULL_END
