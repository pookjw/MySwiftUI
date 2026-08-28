#import <CoreRE/Defines.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN RETransformService _Nullable RETransformServiceFromEntity(REEntity) NS_SWIFT_NAME(getter:Entity.transformService(self:));
RE_EXTERN simd_float4x4 RETransformServiceGetWorldMatrix4x4F(RETransformService, REEntity) NS_SWIFT_NAME(TransformService.worldMatrix4x4F(self:entity:));

NS_ASSUME_NONNULL_END
