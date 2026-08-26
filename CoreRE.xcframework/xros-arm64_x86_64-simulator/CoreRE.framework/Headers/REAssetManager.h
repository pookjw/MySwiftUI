#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REAssetManagerRegisterAssetResolver(REAssetManager, const char *, void *, const char * _Nullable (*)(const char *, const char *, void * _Nullable)) NS_SWIFT_NAME(AssetManager.registerAssetResolver(self:_:_:_:));
RE_EXTERN void REAssetManagerAddCleanupCallback(REAssetManager, void (^)(void)) NS_SWIFT_NAME(AssetManager.addCleanupCallback(self:_:));
RE_EXTERN REAssetDescriptor REMeshAssetCreateSphereDescriptor(REAssetManager, REGeomBuildSphereOptions, bool) NS_SWIFT_NAME(AssetManager.createSphereDescriptor(self:_:_:));
RE_EXTERN REAsset REAssetHandleCreateNewMutableWithAssetDescriptors(REAssetManager, const REAssetDescriptor _Nonnull *, uint32_t) NS_SWIFT_NAME(AssetManager.createNewMutableWithAssetDescriptors(self:_:_:));
RE_EXTERN REAssetLoadRequest REAssetManagerCreateAssetRequest(REAssetManager) NS_SWIFT_NAME(AssetManager.createAssetRequest(self:));
RE_EXTERN bool REAssetLoadRequestSetLoadAndWaitForResourceSharingClients(REAssetLoadRequest, bool, bool, NSError * __autoreleasing _Nullable * _Nullable) NS_SWIFT_NAME(Asset.LoadRequest.setLoadAndWaitForResourceSharingClients(self:_:_:_:));
RE_EXTERN bool REAssetLoadRequestSetShouldBlockECSSendsUntilCompleted(REAssetLoadRequest, bool, NSError * __autoreleasing _Nullable * _Nullable) NS_SWIFT_NAME(Asset.LoadRequest.setShouldBlockECSSendsUntilCompleted(self:_:_:));
RE_EXTERN void REAssetLoadRequestSetCompletionHandler(REAssetLoadRequest, void (^)(bool)) NS_SWIFT_NAME(Asset.LoadRequest.setCompletionHandler(self:_:));
RE_EXTERN REAsset _Nullable REAssetManagerCreateAssetHandle(REAssetManager, const char *) NS_SWIFT_NAME(AssetManager.createAssetHandle(self:_:));
RE_EXTERN void REAssetManagerPreloadVideoAssetOnce(REAssetManager, REAsset, REVideoViewingMode) NS_SWIFT_NAME(AssetManager.preloadVideoAssetOnce(self:_:_:));

NS_ASSUME_NONNULL_END
