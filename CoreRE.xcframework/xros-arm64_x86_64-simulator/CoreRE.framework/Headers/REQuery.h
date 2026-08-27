#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REQuery REQueryCreateEntityQuery(REPredicate) NS_SWIFT_NAME(Query.init(predicate:));
RE_EXTERN void REEntityQueryDestroy(REQuery) NS_SWIFT_NAME(Query.destroy(self:));
RE_EXTERN REPredicate REQueryCreateHasEntityPredicate(void) NS_SWIFT_NAME(getter:Predicate.hasEntity());
RE_EXTERN void REQueryConnectEntityPredicates(REPredicate, REPredicate) NS_SWIFT_NAME(Predicate.connectEntityPredicate(self:_:));

NS_ASSUME_NONNULL_END
