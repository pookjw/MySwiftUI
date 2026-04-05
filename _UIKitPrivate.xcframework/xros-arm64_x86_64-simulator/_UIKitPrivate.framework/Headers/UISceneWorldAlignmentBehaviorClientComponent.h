#import <FrontBoardServices/FrontBoardServices.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, UISceneWorldAlignmentBehavior) {
    UISceneWorldAlignmentBehaviorUnspecified = 0,
    UISceneWorldAlignmentBehaviorFrontFacing = 1,
    UISceneWorldAlignmentBehaviorFloorAligned = 2
};

UIKIT_EXTERN NSString * _NSStringFromUISceneWorldAlignmentBehavior(UISceneWorldAlignmentBehavior);

@interface _UISceneWorldAlignmentBehaviorClientComponent : FBSSceneComponent
@property (nonatomic) UISceneWorldAlignmentBehavior worldAlignmentBehavior;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
