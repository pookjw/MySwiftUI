#ifndef AGAttribute_h
#define AGAttribute_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/Defines.h>

typedef NS_OPTIONS(uint32_t, AGAttributeTypeFlags) {
    AGAttributeTypeFlagsUnknown = 10
};

struct AGAttribute {};
typedef struct AGAttribute AGAttribute;

AG_EXTERN const AGAttribute AGAttributeNil;

#endif
