#include <TCC/Defines.h>
#include <CoreFoundation/CoreFoundation.h>

const CFStringRef _Nonnull kTCCServiceWorldSensing = CFSTR("kTCCServiceWorldSensing");

TCC_EXTERN tcc_authorization_right_t tcc_authorization_preflight(CFStringRef _Nonnull, void * _Nullable);
TCC_EXTERN void tcc_authorization_request(CFStringRef _Nonnull, void * _Nullable, void (^)(tcc_authorization_right_t));
