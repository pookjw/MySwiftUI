#ifndef SoftLindking_h
#define SoftLindking_h

#ifdef __cplusplus
#define SL_EXTERN       extern "C"
#else
#define SL_EXTERN           extern
#endif

SL_EXTERN void *_sl_dlopen(const char **, void **);

#endif
