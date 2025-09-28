#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define RSS_EXTERN       extern "C"
#else
#define RSS_EXTERN           extern
#endif

typedef NS_ENUM(NSUInteger, RSSSceneAlignment) {
    RSSSceneAlignmentUndefined = 0,
    RSSSceneAlignmentVertical = 1,
    RSSSceneAlignmentHorizontal = 2
};

RSS_EXTERN NSString * NSStringFromRSSSceneAlignment(RSSSceneAlignment alignment);

typedef NS_ENUM(NSUInteger, RSSAnchoredPlane) {
    RSSAnchoredPlaneUndefined = 0,
    RSSAnchoredPlaneVertical = 1,
    RSSAnchoredPlaneHorizontal = 2
};

NS_ASSUME_NONNULL_END

#endif
