#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEventBusRef _Nullable REServiceLocatorGetEventBus(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.eventBus(self:));
RE_EXTERN void REECSManagerSetSwiftObject(REECSServiceRef, void * _Nullable) NS_SWIFT_NAME(setter:ECSService.swiftObject(self:_:));
RE_EXTERN void * _Nullable REECSManagerGetSwiftObject(REECSServiceRef) NS_SWIFT_NAME(getter:ECSService.swiftObject(self:));

NS_ASSUME_NONNULL_END
