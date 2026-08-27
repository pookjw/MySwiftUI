#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEventBus _Nullable REServiceLocatorGetEventBus(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.eventBus(self:));
RE_EXTERN void REECSManagerSetSwiftObject(REECSManager, void * _Nullable) NS_SWIFT_NAME(setter:ECSManager.swiftObject(self:_:));
RE_EXTERN void * _Nullable REECSManagerGetSwiftObject(REECSManager) NS_SWIFT_NAME(getter:ECSManager.swiftObject(self:));
RE_EXTERN REServiceLocator REECSManagerGetServiceLocator(REECSManager) NS_SWIFT_NAME(getter:ECSManager.serviceLocator(self:));
RE_EXTERN RECustomSystem _Nullable REECSManagerGetCustomSystemAtID(REECSManager, int32_t) NS_SWIFT_NAME(ECSManager.customSystem(self:atId:));

NS_ASSUME_NONNULL_END
