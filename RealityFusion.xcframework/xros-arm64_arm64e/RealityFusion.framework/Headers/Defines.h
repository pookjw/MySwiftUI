#ifndef RF_Defines_h
#define RF_Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define RF_EXTERN       extern "C"
#else
#define RF_EXTERN           extern
#endif

struct RFServiceManager {};
typedef const struct RFServiceManager * RFServiceManagerRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(ServiceManager);

NS_ASSUME_NONNULL_END

#endif
