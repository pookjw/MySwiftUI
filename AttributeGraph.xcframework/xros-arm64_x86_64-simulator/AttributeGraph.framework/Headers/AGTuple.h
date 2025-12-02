#ifndef AGTuple_h
#define AGTuple_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN NSUInteger AGTupleCount(AGTypeID);
AG_EXTERN AGTypeID AGTupleElementType(AGTypeID, NSUInteger);

NS_ASSUME_NONNULL_END

#endif
