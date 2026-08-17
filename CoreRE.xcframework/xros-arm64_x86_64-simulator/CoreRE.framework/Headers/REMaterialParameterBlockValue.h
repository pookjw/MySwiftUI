#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REMaterialParameterBlockValueRef REMaterialParameterBlockValueCreate(void) NS_SWIFT_NAME(MaterialParameterBlockValue.create());
RE_EXTERN REMaterialParameterBlockValueRef REMaterialParameterBlockValueCopy(REMaterialParameterBlockValueRef) NS_SWIFT_NAME(MaterialParameterBlockValue.copy(self:)) NS_RETURNS_RETAINED;
RE_EXTERN void REMaterialParameterBlockValueClearParameter(REMaterialParameterBlockValueRef, const char *) NS_SWIFT_NAME(MaterialParameterBlockValue.clearParameter(self:_:));
RE_EXTERN REMaterialParameterBlockValueParameterType REMaterialParameterBlockValueGetParameterType(REMaterialParameterBlockValueRef, const char *) NS_SWIFT_NAME(MaterialParameterBlockValue.parameterType(self:_:));
RE_EXTERN void REMaterialParameterBlockValueSetColor3(REMaterialParameterBlockValueRef, const char *, simd_float3, uint8_t) NS_SWIFT_NAME(MaterialParameterBlockValue.setColor3(self:_:_:_:));
RE_EXTERN void REMaterialParameterBlockValueSetColor4(REMaterialParameterBlockValueRef, const char *, simd_float4, uint8_t) NS_SWIFT_NAME(MaterialParameterBlockValue.setColor4(self:_:_:_:));
RE_EXTERN bool REMaterialParameterBlockValueGetColor4(REMaterialParameterBlockValueRef, const char *, float *, uint8_t *) NS_SWIFT_NAME(MaterialParameterBlockValue.getColor4(self:_:_:_:));

NS_ASSUME_NONNULL_END
