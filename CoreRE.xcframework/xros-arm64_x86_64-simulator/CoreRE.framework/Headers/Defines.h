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

struct _REComponentTypeClass {};
typedef const struct _REComponentTypeClass * REComponentTypeClass __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(ComponentTypeClass);

struct RECIntrospectionStruct {};
typedef const struct RECIntrospectionStruct * RECIntrospectionStructRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(CIntrospectionStruct);

struct REStructBuilder {};
typedef const struct REStructBuilder * REStructBuilderRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(StructBuilder);

typedef NS_ENUM(uint32_t, REComponentType) {
    REComponentTypeNetwork = 9,
    REComponentTypeTransform = 28,
    REComponentTypeCustom = 36
} NS_SWIFT_NAME(ComponentType);

struct REComponent {};
typedef const struct REComponent * REComponentRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Component);

typedef const void * REComponentClassPtr NS_SWIFT_NAME(Component.ClassPtr);

RE_EXTERN void RERelease(const void *);
RE_EXTERN void RERegisterSwiftCodableCallbacks(CFDataRef _Nullable (* _Nullable)(void *, void *, const int8_t *), bool (* _Nullable)(void *, void *, CFDataRef, const int8_t *));

struct RECustomComponentTypeInfoContext {
    uint64_t unknown0;
    uint32_t unknown1;
    uint64_t unknown2;
    bool (*unknown3)(void * _Nullable, void *, void *, void *, const void *, int64_t);
    bool (*unknown4)(void * _Nullable, void *, void *, void *, void *);
    bool unknown5;
} NS_SWIFT_NAME(CustomComponentTypeInfoContext);
typedef struct RECustomComponentTypeInfoContext RECustomComponentTypeInfoContext;

struct RECustomComponentTypeInfo {
    uint32_t unknown0;
    const int8_t *unknown1;
    uint64_t unknown2;
    uint64_t unknown3;
    void (*unknown4)(void *, void *);
    uint64_t unknown5;
    uint64_t unknown6;
    uint64_t unknown7;
    uint64_t unknown8;
    RECIntrospectionStructRef unknown9;
    const RECustomComponentTypeInfoContext *unknown10;
} NS_SWIFT_NAME(CustomComponentTypeInfo);
typedef struct RECustomComponentTypeInfo RECustomComponentTypeInfo;

NS_ASSUME_NONNULL_END

#endif
