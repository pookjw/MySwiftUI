#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable RENetworkComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.network());

RE_EXTERN void RENetworkComponentSetAlwaysMigrate(REComponent, BOOL) NS_SWIFT_NAME(Component.network_setAlwaysMigrate(self:_:));
RE_EXTERN BOOL RENetworkComponentIsOwnershipLocked(REComponent) NS_SWIFT_NAME(getter:Component.isOwnershipLocked(self:));
RE_EXTERN void RENetworkComponentLockEntity(REComponent) NS_SWIFT_NAME(Component.network_lockEntity(self:));
RE_EXTERN void RENetworkComponentUnlockEntity(REComponent) NS_SWIFT_NAME(Component.network_unlockEntity(self:));
RE_EXTERN BOOL RENetworkComponentIsAuthoritative(REComponent) NS_SWIFT_NAME(getter:Component.network_isAuthoritative(self:));
RE_EXTERN void RENetworkComponentRequestOwnershipV2(REComponent, BOOL, const void * _Nullable, NSUInteger, double)  NS_SWIFT_NAME(Component.network_requestOwnershipV2(self:_:_:_:_:));

NS_ASSUME_NONNULL_END
