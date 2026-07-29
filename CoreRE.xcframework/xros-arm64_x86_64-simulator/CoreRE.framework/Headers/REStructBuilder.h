#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REStructBuilderRef REStructBuilderCreate(void) NS_SWIFT_NAME(StructBuilder.init());
RE_EXTERN void REStructBuilderDestroy(REStructBuilderRef) NS_SWIFT_NAME(StructBuilder.destroy(self:));
RE_EXTERN BOOL REStructBuilderInit(REStructBuilderRef, const char *, int32_t, const void * _Nullable, const void * _Nullable) NS_SWIFT_NAME(StructBuilder.initialize(self:_:_:_:_:));
RE_EXTERN void REStructBuilderAddMemberDataTypeWithTag(REStructBuilderRef, int, const char *, REIntrospectedDataType, int) NS_SWIFT_NAME(StructBuilder.addMemberDataTypeWithTag(self:_:_:_:_:));

NS_ASSUME_NONNULL_END
