#ifndef AGWeakAttribute_h
#define AGWeakAttribute_h

#import <AttributeGraph/Defines.h>

AG_EXTERN AGWeakAttribute AGCreateWeakAttribute(AGAttribute) NS_SWIFT_NAME(AGWeakAttribute.init(_:));
AG_EXTERN AGAttribute AGWeakAttributeGetAttribute(AGWeakAttribute) NS_SWIFT_NAME(getter:AGWeakAttribute._attribute(self:));

#endif
