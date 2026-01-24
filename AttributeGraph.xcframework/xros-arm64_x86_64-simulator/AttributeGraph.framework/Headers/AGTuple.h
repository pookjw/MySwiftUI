#ifndef AGTuple_h
#define AGTuple_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN NSUInteger AGTupleCount(AGTupleType) NS_SWIFT_NAME(getter:AGTupleType.count(self:));
AG_EXTERN AGTypeID AGTupleElementType(AGTupleType, NSUInteger);

NS_ASSUME_NONNULL_END

#endif
