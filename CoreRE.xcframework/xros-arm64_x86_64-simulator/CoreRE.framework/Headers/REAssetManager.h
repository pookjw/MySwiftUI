#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REAssetManagerRegisterAssetResolver(REAssetManagerRef, const char *, void *, const char * _Nullable (*)(const char *, const char *, void * _Nullable)) NS_SWIFT_NAME(AssetManager.registerAssetResolver(self:_:_:_:));
RE_EXTERN void REAssetManagerAddCleanupCallback(REAssetManagerRef, void (^)(void)) NS_SWIFT_NAME(AssetManager.addCleanupCallback(self:_:));
RE_EXTERN REAssetDescriptorRef REMeshAssetCreateSphereDescriptor(REAssetManagerRef, REGeomBuildSphereOptions, bool) NS_SWIFT_NAME(AssetManager.createSphereDescriptor(self:_:_:));
RE_EXTERN REAssetRef REAssetHandleCreateNewMutableWithAssetDescriptors(REAssetManagerRef, const REAssetDescriptorRef _Nonnull *, uint32_t) NS_SWIFT_NAME(AssetManager.createNewMutableWithAssetDescriptors(self:_:_:));
RE_EXTERN REAssetLoadRequestRef REAssetManagerCreateAssetRequest(REAssetManagerRef) NS_SWIFT_NAME(AssetManager.createAssetRequest(self:));
RE_EXTERN bool REAssetLoadRequestSetLoadAndWaitForResourceSharingClients(REAssetLoadRequestRef, bool, bool, NSError * __autoreleasing _Nullable * _Nullable) NS_SWIFT_NAME(Asset.LoadRequest.setLoadAndWaitForResourceSharingClients(self:_:_:_:));
RE_EXTERN bool REAssetLoadRequestSetShouldBlockECSSendsUntilCompleted(REAssetLoadRequestRef, bool, NSError * __autoreleasing _Nullable * _Nullable) NS_SWIFT_NAME(Asset.LoadRequest.setShouldBlockECSSendsUntilCompleted(self:_:_:));
RE_EXTERN void REAssetLoadRequestSetCompletionHandler(REAssetLoadRequestRef, void (^)(bool)) NS_SWIFT_NAME(Asset.LoadRequest.setCompletionHandler(self:_:));

NS_ASSUME_NONNULL_END
