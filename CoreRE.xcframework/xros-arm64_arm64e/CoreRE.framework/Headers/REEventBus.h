#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN void REEventBusSetSwiftObject(REEventBusRef, void * _Nullable) NS_SWIFT_NAME(setter:EventBus.swiftObject(self:_:));
RE_EXTERN void * _Nullable REEventBusGetSwiftObject(REEventBusRef) NS_SWIFT_NAME(getter:EventBus.swiftObject(self:));
RE_EXTERN void REEventBusUnsubscribe(REEventBusRef, RESubscriptionHandle) NS_SWIFT_NAME(EventBus.unsubscribe(self:_:));
RE_EXTERN RESubscriptionHandle REEventBusSubscribeWithMatch(REEventBusRef, unsigned long long, void * _Nullable, REEventHandlerResult (^)(void * _Nullable, const void *), const void *) NS_SWIFT_NAME(EventBus.subscribeWithMatch(self:_:_:_:_:));
RE_EXTERN unsigned long long REEventBusMakeID(const char *) NS_SWIFT_NAME(EventBus.makeID(_:));

NS_ASSUME_NONNULL_END
