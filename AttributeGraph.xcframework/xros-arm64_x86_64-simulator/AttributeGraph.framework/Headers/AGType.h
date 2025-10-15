#ifndef AGType_h
#define AGType_h

#import <CoreFoundation/CoreFoundation.h>
#import <AttributeGraph/Defines.h>

AG_EXTERN CFStringRef AGTypeDescription(AGTypeID) CF_RETURNS_RETAINED;
AG_EXTERN AGTypeSignature AGTypeGetSignature(AGTypeID) NS_SWIFT_NAME(getter:TypeID.signature(self:));

#endif
