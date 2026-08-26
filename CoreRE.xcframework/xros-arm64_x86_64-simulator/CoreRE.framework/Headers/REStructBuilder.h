#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REStructBuilder REStructBuilderCreate(void) NS_SWIFT_NAME(StructBuilder.init());
RE_EXTERN void REStructBuilderDestroy(REStructBuilder) NS_SWIFT_NAME(StructBuilder.destroy(self:));
RE_EXTERN BOOL REStructBuilderInit(REStructBuilder, const char *, int32_t, const void * _Nullable, const void * _Nullable) NS_SWIFT_NAME(StructBuilder.initialize(self:_:_:_:_:));
RE_EXTERN void REStructBuilderAddMemberDataTypeWithTag(REStructBuilder, int, const char *, REIntrospectedDataType, int) NS_SWIFT_NAME(StructBuilder.addMemberDataTypeWithTag(self:_:_:_:_:));
RE_EXTERN void REStructBuilderAddMemberCStyleArrayDataTypeWithTag(REStructBuilder, int, const char *, REIntrospectedDataType, int, int) NS_SWIFT_NAME(StructBuilder.addMemberCStyleArrayDataTypeWithTag(self:_:_:_:_:_:));
RE_EXTERN void REStructBuilderAddMemberArrayWithCountDataTypeWithTag(REStructBuilder, int, const char *, int, int, REIntrospectedDataType, int) NS_SWIFT_NAME(StructBuilder.addMemberArrayWithCountDataTypeWithTag(self:_:_:_:_:_:_:));

NS_ASSUME_NONNULL_END
