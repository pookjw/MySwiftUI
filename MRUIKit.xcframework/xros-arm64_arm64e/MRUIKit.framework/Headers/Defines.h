#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define MRUI_EXTERN       extern "C"
#else
#define MRUI_EXTERN           extern
#endif

MRUI_EXTERN NSNotificationName const _MRUISceneDidChangeRelativeTransformNotification NS_SWIFT_NONISOLATED;

NS_ASSUME_NONNULL_END

#endif
