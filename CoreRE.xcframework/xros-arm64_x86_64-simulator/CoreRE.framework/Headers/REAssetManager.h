#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REAssetManagerRegisterAssetResolver(REAssetManagerRef, const char *, void *, const char * _Nullable (*)(const char *, const char *, void * _Nullable)) NS_SWIFT_NAME(AssetManager.registerAssetResolver(self:_:_:_:));
RE_EXTERN void REAssetManagerAddCleanupCallback(REAssetManagerRef, void (^)(void)) NS_SWIFT_NAME(AssetManager.addCleanupCallback(self:_:));

NS_ASSUME_NONNULL_END
