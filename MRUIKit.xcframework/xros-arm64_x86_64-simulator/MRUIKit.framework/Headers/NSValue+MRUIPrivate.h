#import <Foundation/Foundation.h>
#include <simd/simd.h>
#import <MRUIKit/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface NSValue (MRUIPrivate)
+ (NSValue *)_mrui_valueWithSIMDFloat3:(simd_float3)matrix;
+ (NSValue *)_mrui_valueWithRESRT:(RESRT)srt;
- (simd_float3)_mrui_SIMDFloat3Value;
- (RESRT)_mrui_RESRTValue;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
