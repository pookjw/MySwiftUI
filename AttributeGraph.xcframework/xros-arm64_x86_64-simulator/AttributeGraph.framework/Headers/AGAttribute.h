#ifndef AGAttribute_h
#define AGAttribute_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN const AGAttribute AGAttributeNil NS_SWIFT_NAME(AnyAttribute.empty);
AG_EXTERN AGAttribute AGGraphCreateOffsetAttribute2(AGAttribute attribute, const unsigned long offset, const unsigned int size) NS_SWIFT_NAME(AnyAttribute.createOffsetAttribute2(self:offset:size:));
AG_EXTERN const AGAttribute AGGraphGetCurrentAttribute(void);
AG_EXTERN void AGGraphSetIndirectDependency(AGAttribute, AGAttribute);
AG_EXTERN AGAttribute AGGraphGetIndirectAttribute(AGAttribute) NS_SWIFT_NAME(getter:AnyAttribute.indirectAttribute(self:));
AG_EXTERN void AGGraphSetIndirectAttribute(AGAttribute, AGAttribute) NS_SWIFT_NAME(setter:AnyAttribute.indirectAttribute(self:_:));

NS_ASSUME_NONNULL_END

#endif
