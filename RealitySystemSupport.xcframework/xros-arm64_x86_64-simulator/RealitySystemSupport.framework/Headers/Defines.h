#ifndef RCP_Defines_h
#define RCP_Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define RCP_EXTERN       extern "C"
#else
#define RCP_EXTERN           extern
#endif

typedef NS_OPTIONS(uint32_t, RCPInputTargetComponentTargetProperties) {
    RCPInputTargetComponentTargetPropertiesNone = 0,
    RCPInputTargetComponentTargetPropertiesUnknown2 = (1 << 2)
} NS_SWIFT_NAME(InputTargetComponentTargetProperties);

NS_ASSUME_NONNULL_END

#endif
