#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
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
typedef const struct REEntity * REEntityRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Entity);

typedef unsigned long long REEntityID NS_SWIFT_NAME(Entity.ID);

struct REScene {};
typedef const struct REScene * RESceneRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Scene);

struct RECIntrospectionStruct {};
typedef const struct RECIntrospectionStruct * RECIntrospectionStructRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(CIntrospectionStruct);

struct REStructBuilder {};
typedef const struct REStructBuilder * REStructBuilderRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(StructBuilder);

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
    REComponentTypeTransformInteraction = 6020
} NS_SWIFT_NAME(ComponentType);

typedef NS_ENUM(uint32_t, REIntrospectedDataType) {
    REIntrospectedDataTypeUnknown0 = 0,
    REIntrospectedDataTypeUnknown2 = 2,
    REIntrospectedDataTypeUnknown5 = 5,
    REIntrospectedDataTypeUnknown12 = 12,
    REIntrospectedDataTypeUnknown17 = 17
} NS_SWIFT_NAME(IntrospectedDataType);

struct REComponent {};
typedef const struct REComponent * REComponentRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Component);

struct REComponentClass {};
typedef const struct REComponentClass * REComponentClassPtr __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Component.ClassPtr);

RE_EXTERN void RERelease(const void *);
RE_EXTERN const void * RERetain(const void *);
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
    uint64_t unknown2;
    void * (* _Nullable unknown3)(void *);
    void (* _Nullable unknown4)(void *, void *);
    void (* _Nullable unknown5)(void *);
    void (* _Nullable unknown6)(void *);
    void (* _Nullable unknown7)(void *);
    uint64_t unknown8;
    RECIntrospectionStructRef unknown9;
    const RECustomComponentTypeInfoContext * _Nullable unknown10;
} NS_SWIFT_NAME(CustomComponentTypeInfo);
typedef struct RECustomComponentTypeInfo RECustomComponentTypeInfo;

typedef uint32_t RELoadTraceType __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(LoadTraceType);

struct REEngine {};
typedef const struct REEngine * REEngineRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Engine);

struct REEngineConfiguration {};
typedef const struct REEngineConfiguration * REEngineConfigurationRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Engine.Configuration);

typedef NS_ENUM(uint32_t, REEventHandlerResult) {
    REEventHandlerResultUnknown0 = 0
} NS_SWIFT_NAME(EventHandlerResult);

struct REServiceLocator {};
typedef const struct REServiceLocator * REServiceLocatorRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(ServiceLocator);

struct REECSService {};
typedef const struct REECSService * REECSServiceRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(ECSService);

struct REEventBus {};
typedef const struct REEventBus * REEventBusRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(EventBus);

struct REAssetManager {};
typedef const struct REAssetManager * REAssetManagerRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(AssetManager);

struct RETimebaseService {};
typedef const struct RETimebaseService * RETimebaseServiceRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(TimebaseService);

struct RERenderManager {};
typedef const struct RERenderManager * RERenderManagerRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(RenderManager);

NS_ASSUME_NONNULL_END

#endif
