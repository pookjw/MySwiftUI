#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable REMeshComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.mesh());
RE_EXTERN REAssetRef _Nullable REMeshComponentGetMesh(REComponentRef) NS_SWIFT_NAME(getter:Component.meshComponent_mesh(self:));
RE_EXTERN void REMeshComponentSetMesh(REComponentRef, REAssetRef _Nullable) NS_SWIFT_NAME(setter:Component.meshComponent_mesh(self:_:));
RE_EXTERN float REMeshComponentGetBoundsMargin(REComponentRef) NS_SWIFT_NAME(getter:Component.meshComponent_boundsMargin(self:));
RE_EXTERN void REMeshComponentSetBoundsMargin(REComponentRef, float) NS_SWIFT_NAME(setter:Component.meshComponent_boundsMargin(self:_:));
RE_EXTERN NSInteger REMeshComponentGetMaterialCount(REComponentRef) NS_SWIFT_NAME(getter:Component.meshComponent_materialCount(self:));
RE_EXTERN void REMeshComponentRemoveAllMaterials(REComponentRef) NS_SWIFT_NAME(Component.meshComponent_removeAllMaterials(self:));
RE_EXTERN void REMeshComponentAddMaterialWithParameters(REComponentRef, REAssetRef, REEntityRef _Nullable) NS_SWIFT_NAME(Component.meshComponent_addMaterialWithParameters(self:_:_:));
RE_EXTERN void REMeshComponentAddMaterial(REComponentRef, REAssetRef) NS_SWIFT_NAME(Component.meshComponent_addMaterial(self:_:));
RE_EXTERN REAssetRef _Nullable REMeshComponentGetMaterialAtIndex(REComponentRef, NSInteger) NS_SWIFT_NAME(Component.meshComponent_materialAtIndex(self:_:));
RE_EXTERN void REMeshComponentSetMaterialWithParametersAtIndex(REComponentRef, NSInteger, REAssetRef, REEntityRef _Nullable) NS_SWIFT_NAME(Component.meshComponent_setMaterialWithParametersAtIndex(self:_:_:_:));
RE_EXTERN void REMeshComponentSetMaterialAtIndex(REComponentRef, NSInteger, REAssetRef) NS_SWIFT_NAME(Component.meshComponent_setMaterialAtIndex(self:_:_:));

NS_ASSUME_NONNULL_END
