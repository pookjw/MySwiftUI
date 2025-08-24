#ifndef AGAttribute_h
#define AGAttribute_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/Defines.h>

typedef NS_OPTIONS(uint32_t, AGAttributeTypeFlags) {
    AGAttributeTypeFlagsUnknown = 10
};

typedef uint32_t AGAttribute __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(AnyAttribute);

AG_EXTERN const AGAttribute AGAttributeNil;

#endif
