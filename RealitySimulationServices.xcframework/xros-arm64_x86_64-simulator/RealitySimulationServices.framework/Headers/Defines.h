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
    RSSAnchoredPlaneUnspecified = 0,
    RSSAnchoredPlaneVertical = 1,
    RSSAnchoredPlaneHorizontal = 2
};

typedef NS_ENUM(NSUInteger, RSSScenePlacementClassification) {
    RSSScenePlacementClassificationUnspecified = 0,
    RSSScenePlacementClassificationWall = 1,
    RSSScenePlacementClassificationFloor = 2,
    RSSScenePlacementClassificationCeiling = 3
};

RSS_EXTERN NSString * NSStringFromRSSScenePlacementClassification(RSSScenePlacementClassification classification);

typedef NS_ENUM(NSUInteger, RCPSurfaceSnappingClassification) {
    RCPSurfaceSnappingClassificationNone = 0,
    RCPSurfaceSnappingClassificationWall = 1,
    RCPSurfaceSnappingClassificationFloor = 2,
    RCPSurfaceSnappingClassificationCeiling = 3,
    RCPSurfaceSnappingClassificationTable = 4,
    RCPSurfaceSnappingClassificationSeat = 5,
    RCPSurfaceSnappingClassificationWindow = 6,
    RCPSurfaceSnappingClassificationDoor = 7,
    RCPSurfaceSnappingClassificationStairs = 8,
    RCPSurfaceSnappingClassificationBed = 9,
    RCPSurfaceSnappingClassificationCabinet = 10,
    RCPSurfaceSnappingClassificationHomeAppliance = 11,
    RCPSurfaceSnappingClassificationTV = 12,
    RCPSurfaceSnappingClassificationPlant = 13,
    RCPSurfaceSnappingClassificationWallDecoration = 14,
    RCPSurfaceSnappingClassificationBlinds = 15,
    RCPSurfaceSnappingClassificationFireplace = 16,
    RCPSurfaceSnappingClassificationCounter = 17,
    RCPSurfaceSnappingClassificationDoorFrame = 18,
    RCPSurfaceSnappingClassificationWhiteboard = 19,
};

NS_ASSUME_NONNULL_END

#endif
