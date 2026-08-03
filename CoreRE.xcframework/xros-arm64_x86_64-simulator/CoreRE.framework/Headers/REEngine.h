#import <CoreRE/Defines.h>
#import <Dispatch/Dispatch.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEngineRef _Nullable REEngineGetShared(void) NS_SWIFT_NAME(getter:Engine.shared());
RE_EXTERN void REEngineSetShared(REEngineRef _Nullable) NS_SWIFT_NAME(setter:Engine.shared(_:));
RE_EXTERN REEngineConfigurationRef REEngineConfigurationCreateFromEngine(REEngineRef) NS_SWIFT_NAME(Engine.Configuration.init(engine:));
RE_EXTERN REEngineConfigurationRef REEngineConfigurationClone(REEngineConfigurationRef) NS_SWIFT_NAME(Engine.Configuration.clone(self:));
RE_EXTERN dispatch_queue_t _Nullable REEngineConfigurationGetEngineQueue(REEngineConfigurationRef) NS_SWIFT_NAME(getter:Engine.Configuration.engineQueue(self:));
RE_EXTERN bool REEngineConfigurationGetEnableInteractions(REEngineConfigurationRef) NS_SWIFT_NAME(getter:Engine.Configuration.enableInteractions(self:));
RE_EXTERN void REEngineConfigurationSetEnableInteractions(REEngineConfigurationRef, bool) NS_SWIFT_NAME(setter:Engine.Configuration.enableInteractions(self:_:));
RE_EXTERN void REEngineSetCallbacksEx(REEngineRef, const void * _Nullable, REEventHandlerResult (* _Nullable)(void *)) NS_SWIFT_NAME(Engine.setCallbacksEx(self:_:_:));
RE_EXTERN void REEngineSetSwiftObject(REEngineRef, void * _Nullable) NS_SWIFT_NAME(setter:Engine.swiftObject(self:_:));
RE_EXTERN void * _Nullable REEngineGetSwiftObject(REEngineRef) NS_SWIFT_NAME(getter:Engine.swiftObject(self:));
RE_EXTERN REServiceLocatorRef REEngineGetServiceLocator(REEngineRef) NS_SWIFT_NAME(getter:Engine.serviceLocator(self:));
RE_EXTERN bool REEngineConfigurationGetUseRealityIO(REEngineConfigurationRef) NS_SWIFT_NAME(getter:Engine.Configuration.useRealityIO(self:));
RE_EXTERN void REEngineConfigurationSetUseRealityIO(REEngineConfigurationRef, bool) NS_SWIFT_NAME(setter:Engine.Configuration.useRealityIO(self:_:));
RE_EXTERN bool REEngineConfigurationGetUseMetal(REEngineConfigurationRef) NS_SWIFT_NAME(getter:Engine.Configuration.useMetal(self:));
RE_EXTERN void REEngineConfigurationSetUseMetal(REEngineConfigurationRef, bool) NS_SWIFT_NAME(setter:Engine.Configuration.useMetal(self:_:));
RE_EXTERN void REEngineConfigurationSetServicesToCreate(REEngineConfigurationRef, REEngineServiceMask) NS_SWIFT_NAME(setter:Engine.Configuration.servicesToCreate(self:_:));
RE_EXTERN REEngineServiceMask REEngineConfigurationGetServicesToCreate(REEngineConfigurationRef) NS_SWIFT_NAME(getter:Engine.Configuration.servicesToCreate(self:));
RE_EXTERN REEventBusRef REEngineGetEventBus(REEngineRef) NS_SWIFT_NAME(getter:Engine.eventBus(self:));

NS_ASSUME_NONNULL_END
