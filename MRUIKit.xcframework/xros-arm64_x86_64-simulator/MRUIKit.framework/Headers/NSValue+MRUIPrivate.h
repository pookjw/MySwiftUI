#import <Foundation/Foundation.h>
#include <simd/simd.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface NSValue (MRUIPrivate)
+ (NSValue *)_mrui_valueWithSIMDFloat3:(simd_float3)matrix;
- (simd_float3)_mrui_SIMDFloat3Value;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
