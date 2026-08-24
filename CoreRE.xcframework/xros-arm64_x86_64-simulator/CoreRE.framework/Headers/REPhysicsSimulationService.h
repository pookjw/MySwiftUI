#import <CoreRE/Defines.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN simd_float4 REPhysicsSimulationServiceGetDefaultGravity(REPhysicsSimulationServiceRef) NS_SWIFT_NAME(getter:PhysicsSimulationService.defaultGravity(self:));
RE_EXTERN void REPhysicsSimulationServiceSetDefaultGravity(REPhysicsSimulationServiceRef, simd_float4) NS_SWIFT_NAME(setter:PhysicsSimulationService.defaultGravity(self:_:));

NS_ASSUME_NONNULL_END
