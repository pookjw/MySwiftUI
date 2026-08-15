#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REAssetSetSwiftObject(REAssetRef, void * _Nullable) NS_SWIFT_NAME(setter:Asset.swiftObject(self:_:));
RE_EXTERN void * _Nullable REAssetGetSwiftObject(REAssetRef) NS_SWIFT_NAME(getter:Asset.swiftObject(self:));
RE_EXTERN void REAssetHandleLoadNow(REAssetRef) NS_SWIFT_NAME(Asset.handleLoadNow(self:));
RE_EXTERN bool REAssetSetNetworkSharingMode(REAssetRef, REAssetNetworkSharingMode) NS_SWIFT_NAME(Asset.setNetworkSharingMode(self:_:));

NS_ASSUME_NONNULL_END
