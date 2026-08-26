#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REAssetSetSwiftObject(REAsset, void * _Nullable) NS_SWIFT_NAME(setter:Asset.swiftObject(self:_:));
RE_EXTERN void * _Nullable REAssetGetSwiftObject(REAsset) NS_SWIFT_NAME(getter:Asset.swiftObject(self:));
RE_EXTERN void REAssetHandleLoadNow(REAsset) NS_SWIFT_NAME(Asset.handleLoadNow(self:));
RE_EXTERN bool REAssetSetNetworkSharingMode(REAsset, REAssetNetworkSharingMode) NS_SWIFT_NAME(Asset.setNetworkSharingMode(self:_:));
RE_EXTERN void REAssetLoadRequestAddAsset(REAssetLoadRequest, REAsset) NS_SWIFT_NAME(Asset.LoadRequest.addAsset(self:_:));
RE_EXTERN bool REVideoAssetGetPreventPlaybackUntilReady(REAsset) NS_SWIFT_NAME(getter:Asset.preventPlaybackUntilReady(self:));
RE_EXTERN void REVideoAssetSetPreventPlaybackUntilReady(REAsset, bool) NS_SWIFT_NAME(setter:Asset.preventPlaybackUntilReady(self:_:));
RE_EXTERN NSInteger REMeshAssetGetTotalSkeletonCount(REAsset) NS_SWIFT_NAME(getter:Asset.totalSkeletonCount(self:));
RE_EXTERN NSInteger REMeshAssetGetModelCount(REAsset) NS_SWIFT_NAME(getter:Asset.modelCount(self:));
RE_EXTERN NSInteger REMeshAssetGetBlendShapeGroupCount(REAsset, NSInteger) NS_SWIFT_NAME(Asset.blendShapeGroupCount(self:_:));
RE_EXTERN bool REMaterialAssetHasGeometryModifierCustomParamsName(REAsset) NS_SWIFT_NAME(getter:Asset.hasGeometryModifierCustomParamsName(self:));

NS_ASSUME_NONNULL_END
