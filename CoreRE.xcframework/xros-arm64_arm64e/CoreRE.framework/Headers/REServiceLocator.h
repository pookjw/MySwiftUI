#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REECSServiceRef _Nullable REServiceLocatorGetECSService(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.ecsService(self:));
RE_EXTERN REAssetManagerRef _Nullable REServiceLocatorGetAssetManager(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.assetManager(self:));
RE_EXTERN RETimebaseServiceRef _Nullable REServiceLocatorGetTimebaseService(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.timebaseService(self:));
RE_EXTERN void REServiceLocatorSetSwiftObject(REServiceLocatorRef, void * _Nullable) NS_SWIFT_NAME(setter:ServiceLocator.swiftObject(self:_:));
RE_EXTERN void * _Nullable REServiceLocatorGetSwiftObject(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.swiftObject(self:));
RE_EXTERN RERenderManagerRef _Nullable REServiceLocatorGetRenderManager(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.renderManager(self:));
RE_EXTERN REAudioSceneServiceRef _Nullable REServiceLocatorGetAudioSceneService(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.audioSceneService(self:));
RE_EXTERN REEventBusRef _Nullable REServiceLocatorGetEventBus(REServiceLocatorRef) NS_SWIFT_NAME(getter:ServiceLocator.eventBus(self:));

NS_ASSUME_NONNULL_END
