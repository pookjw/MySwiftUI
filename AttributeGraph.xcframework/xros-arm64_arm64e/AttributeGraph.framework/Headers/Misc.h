#ifndef Misc_h
#define Misc_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/Defines.h>

AG_EXTERN NSInteger AGMakeUniqueID(void);

typedef NS_OPTIONS(uint32_t, AGCachedValueOptions) {
    AGCachedValueOptionsUnknown0 = 1 << 0
} NS_SWIFT_NAME(CachedValueOptions);

#endif
