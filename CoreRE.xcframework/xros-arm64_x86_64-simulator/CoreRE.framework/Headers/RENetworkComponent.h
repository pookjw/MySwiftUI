#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void RENetworkComponentSetAlwaysMigrate(REComponentType) NS_SWIFT_NAME(Component.network_setAlwaysMigrate(self:));
RE_EXTERN BOOL RENetworkComponentIsOwnershipLocked(REComponentType) NS_SWIFT_NAME(getter:Component.isOwnershipLocked(self:));
RE_EXTERN void RENetworkComponentLockEntity(REComponentType) NS_SWIFT_NAME(Component.network_lockEntity(self:));
RE_EXTERN void RENetworkComponentUnlockEntity(REComponentType) NS_SWIFT_NAME(Component.network_unlockEntity(self:));
RE_EXTERN BOOL RENetworkComponentIsAuthoritative(REComponentType) NS_SWIFT_NAME(getter:Component.network_isAuthoritative(self:));
RE_EXTERN void RENetworkComponentRequestOwnershipV2(REComponentType, BOOL, const void * _Nullable, NSUInteger, double)  NS_SWIFT_NAME(Component.network_requestOwnershipV2(self:_:_:_:_:));

NS_ASSUME_NONNULL_END
