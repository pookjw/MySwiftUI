#import <UIKit/UIKit.h>
#import <FrontBoardServices/FrontBoardServices.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UISceneConnectionOptions (Private)
@property (readonly, weak, nonatomic) FBSSceneSpecification *_specification; 
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
