#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define RE_EXTERN       extern "C"
#else
#define RE_EXTERN           extern
#endif

struct REEntity {};
typedef const struct REEntity * REEntityRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Entity);

typedef unsigned long long REEntityID NS_SWIFT_NAME(Entity.ID);

struct REScene {};
typedef const struct REScene * RESceneRef __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(Scene);

NS_ASSUME_NONNULL_END

#endif
