#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEventBusRef _Nullable REServiceLocatorGetEventBus(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.eventBus(self:));
RE_EXTERN void REECSManagerSetSwiftObject(REECSManagerRef, void * _Nullable) NS_SWIFT_NAME(setter:ECSManager.swiftObject(self:_:));
RE_EXTERN void * _Nullable REECSManagerGetSwiftObject(REECSManagerRef) NS_SWIFT_NAME(getter:ECSManager.swiftObject(self:));
RE_EXTERN REServiceLocatorRef REECSManagerGetServiceLocator(REECSManagerRef) NS_SWIFT_NAME(getter:ECSManager.serviceLocator(self:));

NS_ASSUME_NONNULL_END
