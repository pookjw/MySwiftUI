#import <CoreRE/Defines.h>
#import <Dispatch/Dispatch.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REEngine _Nullable REEngineGetShared(void) NS_SWIFT_NAME(getter:Engine.shared());
RE_EXTERN void REEngineSetShared(REEngine _Nullable) NS_SWIFT_NAME(setter:Engine.shared(_:));
RE_EXTERN REEngineConfiguration REEngineConfigurationCreateFromEngine(REEngine) NS_SWIFT_NAME(Engine.Configuration.init(engine:));
RE_EXTERN REEngineConfiguration REEngineConfigurationClone(REEngineConfiguration) NS_SWIFT_NAME(Engine.Configuration.clone(self:));
RE_EXTERN dispatch_queue_t _Nullable REEngineConfigurationGetEngineQueue(REEngineConfiguration) NS_SWIFT_NAME(getter:Engine.Configuration.engineQueue(self:));
RE_EXTERN bool REEngineConfigurationGetEnableInteractions(REEngineConfiguration) NS_SWIFT_NAME(getter:Engine.Configuration.enableInteractions(self:));
RE_EXTERN void REEngineConfigurationSetEnableInteractions(REEngineConfiguration, bool) NS_SWIFT_NAME(setter:Engine.Configuration.enableInteractions(self:_:));
RE_EXTERN void REEngineSetCallbacksEx(REEngine, const void * _Nullable, REEventHandlerResult (* _Nullable)(void *)) NS_SWIFT_NAME(Engine.setCallbacksEx(self:_:_:));
RE_EXTERN void REEngineSetSwiftObject(REEngine, void * _Nullable) NS_SWIFT_NAME(setter:Engine.swiftObject(self:_:));
RE_EXTERN void * _Nullable REEngineGetSwiftObject(REEngine) NS_SWIFT_NAME(getter:Engine.swiftObject(self:));
RE_EXTERN REServiceLocator REEngineGetServiceLocator(REEngine) NS_SWIFT_NAME(getter:Engine.serviceLocator(self:));
RE_EXTERN bool REEngineConfigurationGetUseRealityIO(REEngineConfiguration) NS_SWIFT_NAME(getter:Engine.Configuration.useRealityIO(self:));
RE_EXTERN void REEngineConfigurationSetUseRealityIO(REEngineConfiguration, bool) NS_SWIFT_NAME(setter:Engine.Configuration.useRealityIO(self:_:));
RE_EXTERN bool REEngineConfigurationGetUseMetal(REEngineConfiguration) NS_SWIFT_NAME(getter:Engine.Configuration.useMetal(self:));
RE_EXTERN void REEngineConfigurationSetUseMetal(REEngineConfiguration, bool) NS_SWIFT_NAME(setter:Engine.Configuration.useMetal(self:_:));
RE_EXTERN void REEngineConfigurationSetServicesToCreate(REEngineConfiguration, REEngineServiceMask) NS_SWIFT_NAME(setter:Engine.Configuration.servicesToCreate(self:_:));
RE_EXTERN REEngineServiceMask REEngineConfigurationGetServicesToCreate(REEngineConfiguration) NS_SWIFT_NAME(getter:Engine.Configuration.servicesToCreate(self:));
RE_EXTERN REEventBus REEngineGetEventBus(REEngine) NS_SWIFT_NAME(getter:Engine.eventBus(self:));
RE_EXTERN RECALayerServiceFlags REEngineConfigurationGetCALayerServiceFlags(REEngineConfiguration) NS_SWIFT_NAME(getter:Engine.Configuration.caLayerServiceFlags(self:));
RE_EXTERN void REEngineConfigurationSetCALayerServiceFlags(REEngineConfiguration, RECALayerServiceFlags) NS_SWIFT_NAME(setter:Engine.Configuration.caLayerServiceFlags(self:_:));
RE_EXTERN REEngineConfiguration REEngineConfigurationCreateDefault(void) NS_SWIFT_NAME(Engine.Configuration.init());

NS_ASSUME_NONNULL_END
