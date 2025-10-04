#include <TCC/Defines.h>
#include <CoreFoundation/CoreFoundation.h>

const CFStringRef _Nonnull kTCCServiceWorldSensing = CFSTR("kTCCServiceWorldSensing");

TCC_EXTERN tcc_authorization_right_t tcc_authorization_preflight(CFStringRef _Nonnull, void * _Nullable);

/*
아마 void *이 아니라 Flags일 것이며
이 Flags에 따라 dispatch_async를 호출한다.
따라서 CF_NOESCAPE로 인해 Stack Pointer를 참조하여 문제가 될 수 있다. 
*/
TCC_EXTERN void tcc_authorization_request(CFStringRef _Nonnull, void * _Nullable, void (^ CF_NOESCAPE)(tcc_authorization_right_t));
