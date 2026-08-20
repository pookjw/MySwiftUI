#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REAssetSetSwiftObject(REAssetRef, void * _Nullable) NS_SWIFT_NAME(setter:Asset.swiftObject(self:_:));
RE_EXTERN void * _Nullable REAssetGetSwiftObject(REAssetRef) NS_SWIFT_NAME(getter:Asset.swiftObject(self:));
RE_EXTERN void REAssetHandleLoadNow(REAssetRef) NS_SWIFT_NAME(Asset.handleLoadNow(self:));
RE_EXTERN bool REAssetSetNetworkSharingMode(REAssetRef, REAssetNetworkSharingMode) NS_SWIFT_NAME(Asset.setNetworkSharingMode(self:_:));
RE_EXTERN void REAssetLoadRequestAddAsset(REAssetLoadRequestRef, REAssetRef) NS_SWIFT_NAME(Asset.LoadRequest.addAsset(self:_:));
RE_EXTERN bool REVideoAssetGetPreventPlaybackUntilReady(REAssetRef) NS_SWIFT_NAME(getter:Asset.preventPlaybackUntilReady(self:));
RE_EXTERN void REVideoAssetSetPreventPlaybackUntilReady(REAssetRef, bool) NS_SWIFT_NAME(setter:Asset.preventPlaybackUntilReady(self:_:));

NS_ASSUME_NONNULL_END
