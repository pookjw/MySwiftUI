#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UISceneConfiguration (Private)
@property (readonly, nonatomic, nullable) NSString *_bridgingID;
@property (readonly, nonatomic, nullable) NSString *_initialImmersionStyleName;
- (id<UISceneDelegate> _Nullable)sceneDelegate;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
