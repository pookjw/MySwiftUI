#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable RENetworkComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.network());

RE_EXTERN void RENetworkComponentSetAlwaysMigrate(REComponentRef, BOOL) NS_SWIFT_NAME(Component.network_setAlwaysMigrate(self:_:));
RE_EXTERN BOOL RENetworkComponentIsOwnershipLocked(REComponentRef) NS_SWIFT_NAME(getter:Component.isOwnershipLocked(self:));
RE_EXTERN void RENetworkComponentLockEntity(REComponentRef) NS_SWIFT_NAME(Component.network_lockEntity(self:));
RE_EXTERN void RENetworkComponentUnlockEntity(REComponentRef) NS_SWIFT_NAME(Component.network_unlockEntity(self:));
RE_EXTERN BOOL RENetworkComponentIsAuthoritative(REComponentRef) NS_SWIFT_NAME(getter:Component.network_isAuthoritative(self:));
RE_EXTERN void RENetworkComponentRequestOwnershipV2(REComponentRef, BOOL, const void * _Nullable, NSUInteger, double)  NS_SWIFT_NAME(Component.network_requestOwnershipV2(self:_:_:_:_:));

NS_ASSUME_NONNULL_END
