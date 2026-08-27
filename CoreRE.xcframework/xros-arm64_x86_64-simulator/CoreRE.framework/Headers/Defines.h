#ifndef RE_Defines_h
#define RE_Defines_h

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#include <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define RE_EXTERN       extern "C"
#else
#define RE_EXTERN           extern
#endif

typedef struct {
    simd_float3 s;
    simd_quatf r;
    simd_float3 t;
} RESRT NS_SWIFT_NAME(SRT);

struct REEntity {};
typedef const struct REEntity * REEntity __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Entity);

typedef unsigned long long REEntityID NS_SWIFT_NAME(Entity.ID);

struct REScene {};
typedef const struct REScene * REScene __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Scene);

struct RECIntrospectionStruct {};
typedef const struct RECIntrospectionStruct * RECIntrospectionStruct __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(CIntrospectionStruct);

struct REStructBuilder {};
typedef const struct REStructBuilder * REStructBuilder __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(StructBuilder);

typedef NS_ENUM(uint32_t, REComponentType) {
    REComponentTypeImageBasedLight = 5,
    REComponentTypeMesh = 7,
    REComponentTypeNetwork = 9,
    REComponentTypeRigidBody = 22,
    REComponentTypeSkybox = 23,
    REComponentTypeSkeletalPose = 26,
    REComponentTypeTransform = 28,
    REComponentTypeAcousticMesh = 32,
    REComponentTypeCustom = 36,
    REComponentTypeBlendShapeWeights = 37,
    REComponentTypeAREnvironmentProbe = 42,
    REComponentTypeAnimationLibrary = 45,
    REComponentTypeARSegmentation = 46,
    REComponentTypeAmbientLight = 48,
    REComponentTypeDirectionalLight = 49,
    REComponentTypeSpotLight = 50,
    REComponentTypePointLight = 51,
    REComponentTypeShadowMap = 53,
    REComponentTypePerspectiveCamera = 54,
    REComponentTypeOrthographicCamera = 55,
    REComponentTypeCustomMatrixCamera = 56,
    REComponentTypeCollider = 57,
    REComponentTypePhysicsMotion = 58,
    REComponentTypeAnchoring = 63,
    REComponentTypeSceneUnderstanding = 67,
    REComponentTypeAccessibility = 69,
    REComponentTypePointLightShadowMap = 75,
    REComponentTypeDirectionalLightShadowMap = 76,
    REComponentTypeSpotLightShadowMap = 77,
    REComponentTypeDynamicLightShadow = 78,
    REComponentTypeVideo = 1004,
    REComponentTypeCGContext = 1005,
    REComponentTypeDebugMesh = 1006,
    REComponentTypePortal = 1008,
    REComponentTypeWorldRoot = 1009,
    REComponentTypeVFXScene = 2003,
    REComponentTypeHierarchicalFade = 2005,
    REComponentTypeClippingPrimitive = 2017,
    REComponentTypeMeshSorting = 2018,
    REComponentTypePin = 2023,
    REComponentTypeText = 2027,
    REComponentTypeImageBasedLightReceiver = 2028,
    REComponentTypeAttachedTransform = 2037,
    REComponentTypeCharacterController = 2100,
    REComponentTypeCharacterControllerState = 2102,
    REComponentTypeVFXEmitter = 3003,
    REComponentTypeChannelAudio = 3008,
    REComponentTypeAmbientAudio = 3009,
    REComponentTypeSpatialAudio = 3010,
    REComponentTypeAudioMixGroups = 3013,
    REComponentTypeVideoPlayer = 3020,
    REComponentTypeRemoteEffects = 3022,
    REComponentTypeViewAttachment = 4001,
    REComponentTypePhysicsSimulation = 4005,
    REComponentTypeAdaptiveResolution = 4006,
    REComponentTypeGroundingShadow = 4009,
    REComponentTypeInputTarget = 4010,
    REComponentTypePhysicsJoints = 4012,
    REComponentTypeReverb = 5000,
    REComponentTypeVirtualEnvironmentProbe = 5002,
    REComponentTypeEnvironmentLightingConfiguration = 5003,
    REComponentTypeForceEffect = 5004,
    REComponentTypeDockingRegion = 5005,
    REComponentTypeAudioLibrary = 5006,
    REComponentTypeBillboard = 5007,
    REComponentTypeIKParameters = 5008,
    REComponentTypeReference = 5009,
    REComponentTypeImagePresentation = 6000,
    REComponentTypeAudioGroupPlayback = 6010,
    REComponentTypeEnvironmentBlending = 6015,
    REComponentTypeMeshPartInstances = 6016,
    REComponentTypeTransformInteraction = 6020,
    REComponentTypePresentation = 6021
} NS_SWIFT_NAME(ComponentType);

typedef NS_ENUM(uint32_t, REIntrospectedDataType) {
    REIntrospectedDataTypeUnknown0 = 0,
    REIntrospectedDataTypeUnknown2 = 2,
    REIntrospectedDataTypeUnknown5 = 5,
    REIntrospectedDataTypeUnknown12 = 12,
    REIntrospectedDataTypeUnknown17 = 17
} NS_SWIFT_NAME(IntrospectedDataType);

struct REComponent {};
typedef const struct REComponent * REComponent __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Component);

struct REComponentClassPtr {};
typedef const struct REComponentClassPtr * REComponentClassPtr __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Component.ClassPtr);

RE_EXTERN void RERelease(const void *);
RE_EXTERN const void * RERetain(const void *);
RE_EXTERN NSUInteger REGetRetainCount(const void *);

RE_EXTERN bool REIsRSCompatible(void);
RE_EXTERN void RERegisterSwiftCodableCallbacks(CFDataRef _Nullable (* _Nullable)(void *, void *, const int8_t *), bool (* _Nullable)(void *, void *, CFDataRef, const int8_t *));

struct RECustomComponentTypeInfoContext {
    uint64_t unknown0;
    uint32_t unknown1;
    void * _Nullable unknown2;
    bool (*unknown3)(void * _Nullable, void *, void *, void *, void *);
    bool (*unknown4)(void * _Nullable, void *, void *, void *, const void *, int64_t);
    bool unknown5;
} NS_SWIFT_NAME(CustomComponentTypeInfoContext);
typedef struct RECustomComponentTypeInfoContext RECustomComponentTypeInfoContext;

struct RECustomComponentTypeInfo {
    uint32_t unknown0;
    const int8_t *unknown1;
    const void * _Nullable unknown2;
    void * (* _Nullable unknown3)(void *);
    void (* _Nullable unknown4)(void *, void *);
    void (* _Nullable unknown5)(void *);
    void (* _Nullable unknown6)(void *);
    void (* _Nullable unknown7)(void *);
    uint64_t unknown8;
    RECIntrospectionStruct unknown9;
    const RECustomComponentTypeInfoContext * _Nullable unknown10;
} NS_SWIFT_NAME(CustomComponentTypeInfo);
typedef struct RECustomComponentTypeInfo RECustomComponentTypeInfo;

typedef uint32_t RELoadTraceType __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(LoadTraceType);

struct REEngine {};
typedef const struct REEngine * REEngine __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Engine);

struct REEngineConfiguration {};
typedef const struct REEngineConfiguration * REEngineConfiguration __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Engine.Configuration);

typedef NS_ENUM(uint32_t, REEventHandlerResult) {
    REEventHandlerResultUnknown0 = 0
} NS_SWIFT_NAME(EventHandlerResult);

struct REServiceLocator {};
typedef const struct REServiceLocator * REServiceLocator __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(ServiceLocator);

struct REECSManager {};
typedef const struct REECSManager * REECSManager __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(ECSManager);

struct REEventBus {};
typedef const struct REEventBus * REEventBus __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(EventBus);

struct REAssetManager {};
typedef const struct REAssetManager * REAssetManager __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(AssetManager);

struct RETimebaseService {};
typedef const struct RETimebaseService * RETimebaseService __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(TimebaseService);

struct RERenderManager {};
typedef const struct RERenderManager * RERenderManager __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(RenderManager);

struct REAudioSceneService {};
typedef const struct REAudioSceneService * REAudioSceneService __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(AudioSceneService);

typedef NS_OPTIONS(uint32_t, REEngineServiceMask) {
    REEngineServiceMaskNone = 0,
    REEngineServiceMaskUnknown2 = (1 << 2),
    REEngineServiceMaskUnknown5 = (1 << 5)
} NS_SWIFT_NAME(Engine.ServiceMask);

struct REAnimationTimelineEventCreated {};
typedef const struct REAnimationTimelineEventCreated REAnimationTimelineEventCreated __attribute__((swift_wrapper(struct)));

struct REAnimationTimelineEventTerminated {};
typedef const struct REAnimationTimelineEventTerminated REAnimationTimelineEventTerminated __attribute__((swift_wrapper(struct)));

struct REAnimationTimelineEventSkipped {};
typedef const struct REAnimationTimelineEventSkipped REAnimationTimelineEventSkipped __attribute__((swift_wrapper(struct)));

struct REAnimationTimelineEventPause {};
typedef const struct REAnimationTimelineEventPause REAnimationTimelineEventPause __attribute__((swift_wrapper(struct)));

struct REAnimationTimelineEventResume {};
typedef const struct REAnimationTimelineEventResume REAnimationTimelineEventResume __attribute__((swift_wrapper(struct)));

struct REAnimationHasTimelineEventStart {};
typedef const struct REAnimationHasTimelineEventStart REAnimationHasTimelineEventStart __attribute__((swift_wrapper(struct)));

struct REAnimationHasTimelineEventUpdate {};
typedef const struct REAnimationHasTimelineEventUpdate REAnimationHasTimelineEventUpdate __attribute__((swift_wrapper(struct)));

struct REAnimationHasTimelineEventEnd {};
typedef const struct REAnimationHasTimelineEventEnd REAnimationHasTimelineEventEnd __attribute__((swift_wrapper(struct)));

struct RESubscriptionHandle {
    unsigned long long eventID;
    unsigned long long subscriptionID;

} NS_SWIFT_NAME(SubscriptionHandle);
typedef struct RESubscriptionHandle RESubscriptionHandle;

RE_EXTERN const void * RETimelineEventFilter(const char *);

struct REEngineDoUpdateEvent {};
typedef const struct REEngineDoUpdateEvent REEngineDoUpdateEvent __attribute__((swift_wrapper(struct)));

struct REEngineDoRenderEvent {};
typedef const struct REEngineDoRenderEvent REEngineDoRenderEvent __attribute__((swift_wrapper(struct)));

struct RESceneAnchoredStateChangedEvent {};
typedef const struct RESceneAnchoredStateChangedEvent RESceneAnchoredStateChangedEvent __attribute__((swift_wrapper(struct)));

struct RESceneEntityDidAddEvent {};
typedef const struct RESceneEntityDidAddEvent RESceneEntityDidAddEvent __attribute__((swift_wrapper(struct)));

struct RESceneEntityDidActivateEvent {};
typedef const struct RESceneEntityDidActivateEvent RESceneEntityDidActivateEvent __attribute__((swift_wrapper(struct)));

struct RESceneEntityWillDeactivateEvent {};
typedef const struct RESceneEntityWillDeactivateEvent RESceneEntityWillDeactivateEvent __attribute__((swift_wrapper(struct)));

struct RESceneEntityWillRemoveEvent {};
typedef const struct RESceneEntityWillRemoveEvent RESceneEntityWillRemoveEvent __attribute__((swift_wrapper(struct)));

struct RESceneEntityDidReparentEvent {};
typedef const struct RESceneEntityDidReparentEvent RESceneEntityDidReparentEvent __attribute__((swift_wrapper(struct)));

struct REAnimationHasCompletedEvent {};
typedef const struct REAnimationHasCompletedEvent REAnimationHasCompletedEvent __attribute__((swift_wrapper(struct)));

struct REAnimationHasLoopedEvent {};
typedef const struct REAnimationHasLoopedEvent REAnimationHasLoopedEvent __attribute__((swift_wrapper(struct)));

struct REAnimationHasTerminatedEvent {};
typedef const struct REAnimationHasTerminatedEvent REAnimationHasTerminatedEvent __attribute__((swift_wrapper(struct)));

struct REAnimationHasStartedEvent {};
typedef const struct REAnimationHasStartedEvent REAnimationHasStartedEvent __attribute__((swift_wrapper(struct)));

struct RECollisionDidStartEventEx {};
typedef const struct RECollisionDidStartEventEx RECollisionDidStartEventEx __attribute__((swift_wrapper(struct)));

struct RECollisionDidUpdateEventEx {};
typedef const struct RECollisionDidUpdateEventEx RECollisionDidUpdateEventEx __attribute__((swift_wrapper(struct)));

struct RECollisionDidStopEvent {};
typedef const struct RECollisionDidStopEvent RECollisionDidStopEvent __attribute__((swift_wrapper(struct)));

struct REComponentDidAddEvent {};
typedef const struct REComponentDidAddEvent REComponentDidAddEvent __attribute__((swift_wrapper(struct)));

struct REComponentDidActivateEvent {
    REEntity entity;
    REComponentClassPtr componentClass;
};
typedef const struct REComponentDidActivateEvent REComponentDidActivateEvent __attribute__((swift_wrapper(struct)));

struct REComponentWillDeactivateEvent {};
typedef const struct REComponentWillDeactivateEvent REComponentWillDeactivateEvent __attribute__((swift_wrapper(struct)));

struct REComponentWillRemoveEvent {};
typedef const struct REComponentWillRemoveEvent REComponentWillRemoveEvent __attribute__((swift_wrapper(struct)));

struct REComponentDidChangeEvent {};
typedef const struct REComponentDidChangeEvent REComponentDidChangeEvent __attribute__((swift_wrapper(struct)));

struct REMotionStateDidChangeEvent {};
typedef const struct REMotionStateDidChangeEvent REMotionStateDidChangeEvent __attribute__((swift_wrapper(struct)));

struct REOwnershipRequestEvent {
    REEntity _Nullable entity;
    unsigned long long identifier;
    bool * _Nullable unknown0;
};
typedef const struct REOwnershipRequestEvent REOwnershipRequestEvent __attribute__((swift_wrapper(struct)));

struct REOwnershipResponseEvent {};
typedef const struct REOwnershipResponseEvent REOwnershipResponseEvent __attribute__((swift_wrapper(struct)));

struct REOwnershipChangedEvent {};
typedef const struct REOwnershipChangedEvent REOwnershipChangedEvent __attribute__((swift_wrapper(struct)));

struct REAudioPlayerDidStartEvent {};
typedef const struct REAudioPlayerDidStartEvent REAudioPlayerDidStartEvent __attribute__((swift_wrapper(struct)));

struct REAudioPlayerDidCompleteEvent {};
typedef const struct REAudioPlayerDidCompleteEvent REAudioPlayerDidCompleteEvent __attribute__((swift_wrapper(struct)));

struct REEntityPhysicsWillSimulateEvent {};
typedef const struct REEntityPhysicsWillSimulateEvent REEntityPhysicsWillSimulateEvent __attribute__((swift_wrapper(struct)));

struct REEntityPhysicsDidSimulateEvent {};
typedef const struct REEntityPhysicsDidSimulateEvent REEntityPhysicsDidSimulateEvent __attribute__((swift_wrapper(struct)));

struct REEntityForceEffectComputeForcesEvent {};
typedef const struct REEntityForceEffectComputeForcesEvent REEntityForceEffectComputeForcesEvent __attribute__((swift_wrapper(struct)));

struct REAnimationSkeletalPoseUpdateCompleteEvent {};
typedef const struct REAnimationSkeletalPoseUpdateCompleteEvent REAnimationSkeletalPoseUpdateCompleteEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerContentTypeChangedEvent {};
typedef const struct REVideoPlayerContentTypeChangedEvent REVideoPlayerContentTypeChangedEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerVideoSizeChangedEvent {};
typedef const struct REVideoPlayerVideoSizeChangedEvent REVideoPlayerVideoSizeChangedEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerViewingModeChangedEvent {};
typedef const struct REVideoPlayerViewingModeChangedEvent REVideoPlayerViewingModeChangedEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerVideoReceiverEndpointChangedEvent {};
typedef const struct REVideoPlayerVideoReceiverEndpointChangedEvent REVideoPlayerVideoReceiverEndpointChangedEvent __attribute__((swift_wrapper(struct)));

struct REAnchorStateDidAnchorEvent {};
typedef const struct REAnchorStateDidAnchorEvent REAnchorStateDidAnchorEvent __attribute__((swift_wrapper(struct)));

struct REAnchorStateWillUnanchorEvent {};
typedef const struct REAnchorStateWillUnanchorEvent REAnchorStateWillUnanchorEvent __attribute__((swift_wrapper(struct)));

struct REAnchorStateDidFailToAnchorEvent {};
typedef const struct REAnchorStateDidFailToAnchorEvent REAnchorStateDidFailToAnchorEvent __attribute__((swift_wrapper(struct)));

struct REAnchoringTrackingStateEvent {};
typedef const struct REAnchoringTrackingStateEvent REAnchoringTrackingStateEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerContentProfileChangedEvent {};
typedef const struct REVideoPlayerContentProfileChangedEvent REVideoPlayerContentProfileChangedEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerImmersiveViewingModeDidChangeEvent {};
typedef const struct REVideoPlayerImmersiveViewingModeDidChangeEvent REVideoPlayerImmersiveViewingModeDidChangeEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerImmersiveViewingModeWillTransitionEvent {};
typedef const struct REVideoPlayerImmersiveViewingModeWillTransitionEvent REVideoPlayerImmersiveViewingModeWillTransitionEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerImmersiveViewingModeDidTransitionEvent {};
typedef const struct REVideoPlayerImmersiveViewingModeDidTransitionEvent REVideoPlayerImmersiveViewingModeDidTransitionEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerVideoComfortViolationEvent {};
typedef const struct REVideoPlayerVideoComfortViolationEvent REVideoPlayerVideoComfortViolationEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerSpatialVideoModeChangedEvent {};
typedef const struct REVideoPlayerSpatialVideoModeChangedEvent REVideoPlayerSpatialVideoModeChangedEvent __attribute__((swift_wrapper(struct)));

struct REVideoPlayerRenderingStatusEvent {};
typedef const struct REVideoPlayerRenderingStatusEvent REVideoPlayerRenderingStatusEvent __attribute__((swift_wrapper(struct)));

struct REImagePresentationTransitionStartedEvent {};
typedef const struct REImagePresentationTransitionStartedEvent REImagePresentationTransitionStartedEvent __attribute__((swift_wrapper(struct)));

struct REImagePresentationTransitionCompletedEvent {};
typedef const struct REImagePresentationTransitionCompletedEvent REImagePresentationTransitionCompletedEvent __attribute__((swift_wrapper(struct)));

struct RESpatialMediaImmersiveFrameSizeDidChangeEvent {};
typedef const struct RESpatialMediaImmersiveFrameSizeDidChangeEvent RESpatialMediaImmersiveFrameSizeDidChangeEvent __attribute__((swift_wrapper(struct)));

struct REForceEffectParameters {
    REEntity _Nullable entity; // 0x0
    float fixedDeltaTime; // 0x8
    double elapsedTime; // 0x10
    NSInteger physicsBodyCount; // 0x18
    const float * _Nullable distances; // 0x20
    const simd_float3 * _Nullable positions; // 0x28
    const simd_quatf * _Nullable orientations; // 0x30
    const simd_float3 * _Nullable velocities; // 0x38
    const simd_float3 * _Nullable angularVelocities; // 0x40
    const float * _Nullable masses; // 0x48
    const simd_float3x3 * _Nullable inertiaTensors; // 0x50
    const void * _Nullable unknown0; // 0x58
    const void * _Nullable unknown1; // 0x60
    const simd_float3 *forceBuffer; // 0x68
    const simd_float3 *torqueBuffer; // 0x70
    const void *effectData; // 0x78
    NSInteger effectDataCount; // 0x80
} NS_SWIFT_NAME(ForceEffectParameters);
typedef struct REForceEffectParameters REForceEffectParameters;

typedef NS_OPTIONS(uint32_t, RECALayerServiceFlags) {
    RECALayerServiceFlagsNone = 0,
    RECALayerServiceFlagsUnknown4 = (1 << 4)
} NS_SWIFT_NAME(CALayerServiceFlags);

typedef NS_OPTIONS(uint32_t, RERemoteEffectsSettingsModifier) {
    RERemoteEffectsSettingsModifierNone = 0,
    RERemoteEffectsSettingsModifierUnknown0 = (1 << 0)
} NS_SWIFT_NAME(RemoteEffectsSettingsModifier);

typedef NS_OPTIONS(uint32_t, REInputTargetDirectTouchInput) {
    REInputTargetDirectTouchInputNone = 0,
    REInputTargetDirectTouchInputUnknown0 = (1 << 0)
} NS_SWIFT_NAME(InputTargetDirectTouchInput);

typedef NS_ENUM(uint32_t, REScenePhysicsDebugDrawLevel) {
    REScenePhysicsDebugDrawLevelUnknown0 = 0,
    REScenePhysicsDebugDrawLevelUnknown1 = 1
} NS_SWIFT_NAME(Scene.PhysicsDebugDrawLevel);

struct RESystemDependency {
    int32_t unknown0;
    int32_t unknown1;
} NS_SWIFT_NAME(SystemDependency);
typedef struct RESystemDependency RESystemDependency;

struct RECustomSystem {};
typedef const struct RECustomSystem * RECustomSystem __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(CustomSystem);

typedef NS_ENUM(uint32_t, RECustomSystemScheduleType) {
    RECustomSystemScheduleTypeUnknown4 = 4
} NS_SWIFT_NAME(CustomSystemScheduleType);

struct RECustomSystemUpdateContext {};
typedef const struct RECustomSystemUpdateContext * RECustomSystemUpdateContext __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(CustomSystem.UpdateContext);

struct REAsset {};
typedef const struct REAsset * REAsset __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Asset);

/*
C Runtime에서는 x0 (unknown0 + radius), w1 (unknown1, 2, 3)에 저장되나
Swift Runtime에서는 w0 (unknown0), w1 (unknown1, 2, 3), s0/v0 (radius)에 저장된다.
*/
struct REGeomBuildSphereOptions {
    uint16_t unknown0;
    float radius;
    bool unknown1;
    bool unknown2;
    bool unknown3;
} NS_SWIFT_NAME(GeomBuildSphereOptions);
typedef struct REGeomBuildSphereOptions REGeomBuildSphereOptions;

typedef NS_ENUM(uint32_t, REAssetNetworkSharingMode) {
    REAssetNetworkSharingModeUnknown0 = 0
} NS_SWIFT_NAME(Asset.NetworkSharingMode);

struct REAssetDescriptor {};
typedef const struct REAssetDescriptor * REAssetDescriptor __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Asset.Descriptor);

struct REAssetLoadRequest {};
typedef const struct REAssetLoadRequest * REAssetLoadRequest __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Asset.LoadRequest);

typedef struct __attribute__((objc_bridge(id))) REMaterialParameterBlockValue * REMaterialParameterBlockValueRef NS_SWIFT_NAME(MaterialParameterBlockValue);

typedef NS_ENUM(uint32_t, REMaterialParameterBlockValueParameterType) {
    REMaterialParameterBlockValueParameterTypeUnknown19 = 19,
    REMaterialParameterBlockValueParameterTypeUnknown20 = 20
} NS_SWIFT_NAME(MaterialParameterBlockValue.ParameterType);

RE_EXTERN void RECGColorToColorGamut(CGColorRef, float *, uint8_t *);
RE_EXTERN CGColorRef RECreateCGColorFromColorGamut(simd_float4, uint8_t) NS_RETURNS_RETAINED;

typedef NS_ENUM(uint32_t, REVideoViewingMode) {
    REVideoViewingModeUndefined = 0,
    REVideoViewingModeMono = 1,
    REVideoViewingModeStereo = 2
} NS_SWIFT_NAME(VideoViewingMode);

struct REPhysicsSimulationService {};
typedef const struct REPhysicsSimulationService * REPhysicsSimulationService __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(PhysicsSimulationService);

RE_EXTERN bool REShadowsGetEnableDefaultShadows(void);

struct REQuery {};
typedef const struct REQuery * REQuery __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Query);
struct REPredicate {};
typedef const struct REPredicate * REPredicate __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Predicate);

struct REComponents {
    REComponent *components;
    NSInteger count;
} NS_SWIFT_NAME(Components);
typedef struct REComponents REComponents;

typedef const struct RECustomSystem * RECustomSystem __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(CustomSystem);

NS_ASSUME_NONNULL_END

#endif
