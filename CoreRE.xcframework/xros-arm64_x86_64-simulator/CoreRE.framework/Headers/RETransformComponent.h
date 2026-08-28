#import <CoreRE/Defines.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable RETransformComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.transform());
RE_EXTERN RESRT RETransformComponentGetLocalSRT(REComponent) NS_SWIFT_NAME(getter:Component.transform_localSRT(self:));
RE_EXTERN void RETransformComponentSetLocalSRT(REComponent, RESRT) NS_SWIFT_NAME(setter:Component.transform_localSRT(self:_:));
RE_EXTERN simd_float4x4 RETransformComponentGetWorldMatrix4x4F(REComponent) NS_SWIFT_NAME(getter:Component.transform_worldMatrix4x4F(self:));

NS_ASSUME_NONNULL_END
