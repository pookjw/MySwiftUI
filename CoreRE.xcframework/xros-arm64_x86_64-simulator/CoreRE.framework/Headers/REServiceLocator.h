#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REECSManager _Nullable REServiceLocatorGetECSService(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.ecsService(self:));
RE_EXTERN REAssetManager _Nullable REServiceLocatorGetAssetManager(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.assetManager(self:));
RE_EXTERN RETimebaseService _Nullable REServiceLocatorGetTimebaseService(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.timebaseService(self:));
RE_EXTERN void REServiceLocatorSetSwiftObject(REServiceLocator, void * _Nullable) NS_SWIFT_NAME(setter:ServiceLocator.swiftObject(self:_:));
RE_EXTERN void * _Nullable REServiceLocatorGetSwiftObject(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.swiftObject(self:));
RE_EXTERN RERenderManager _Nullable REServiceLocatorGetRenderManager(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.renderManager(self:));
RE_EXTERN REAudioSceneService _Nullable REServiceLocatorGetAudioSceneService(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.audioSceneService(self:));
RE_EXTERN REEventBus _Nullable REServiceLocatorGetEventBus(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.eventBus(self:));
RE_EXTERN REPhysicsSimulationService _Nullable REServiceLocatorGetPhysicsSimulationService(REServiceLocator) NS_SWIFT_NAME(getter:ServiceLocator.physicsSimulationService(self:));

NS_ASSUME_NONNULL_END
