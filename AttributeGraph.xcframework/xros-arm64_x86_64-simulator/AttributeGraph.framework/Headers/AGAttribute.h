#ifndef AGAttribute_h
#define AGAttribute_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN const AGAttribute AGAttributeNil NS_SWIFT_NAME(AnyAttribute.empty);
AG_EXTERN AGAttribute AGGraphCreateOffsetAttribute2(AGAttribute attribute, const unsigned long offset, const unsigned int size) NS_SWIFT_NAME(AnyAttribute.createOffsetAttribute2(self:offset:size:));

NS_ASSUME_NONNULL_END

#endif
