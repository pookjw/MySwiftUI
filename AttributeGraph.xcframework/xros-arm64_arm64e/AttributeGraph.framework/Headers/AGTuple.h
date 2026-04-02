#ifndef AGTuple_h
#define AGTuple_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN NSUInteger AGTupleCount(AGTupleType) NS_SWIFT_NAME(getter:TupleType.count(self:));
AG_EXTERN AGTypeID AGTupleElementType(AGTupleType, NSInteger);
AG_EXTERN NSInteger AGTupleElementOffset(AGTupleType, NSInteger) NS_SWIFT_NAME(TupleType.offset(self:at:));

NS_ASSUME_NONNULL_END

#endif
