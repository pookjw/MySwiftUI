#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REStructBuilderRef REStructBuilderCreate(void) NS_RETURNS_RETAINED NS_SWIFT_NAME(StructBuilder.init());
RE_EXTERN BOOL REStructBuilderInit(REStructBuilderRef, int32_t, const char *, const void * _Nullable, const void * _Nullable) NS_SWIFT_NAME(StructBuilder.initialize(self:_:_:_:_:));

NS_ASSUME_NONNULL_END
