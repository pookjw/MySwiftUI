#ifndef AGType_h
#define AGType_h

#import <CoreFoundation/CoreFoundation.h>
#import <AttributeGraph/Defines.h>

#if defined(__LLP64__) && __LLP64__
typedef unsigned long long AGTypeID;
#else
typedef unsigned long AGTypeID;
#endif

AG_EXTERN CFStringRef AGTypeDescription(AGTypeID) CF_RETURNS_RETAINED;

#endif
