#import <CoreRE/Defines.h>
#import <simd/simd.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN simd_float4x4 RESRTMatrix(RESRT) NS_SWIFT_NAME(getter:SRT.matrix(self:));
RE_EXTERN RESRT REMakeSRTFromMatrix(simd_float4x4) NS_SWIFT_NAME(SRT.init(matrix:));

NS_ASSUME_NONNULL_END
