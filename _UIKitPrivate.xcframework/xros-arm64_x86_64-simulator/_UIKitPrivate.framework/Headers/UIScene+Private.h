#import <UIKit/UIKit.h>
#import <FrontBoardServices/FrontBoardServices.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIScene (Private)
@property (nonatomic, readonly, getter=_FBSScene) FBSScene *_FBSScene;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
