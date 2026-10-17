#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UIInteractionEffect.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol UIInteraction_Private <UIInteraction>
@optional
@property (retain, nonatomic, nullable) id<UIInteractionEffect> interactionEffect;
- (void)_didMoveFromWindow:(UIWindow * _Nullable)fromWindow toWindow:(UIWindow * _Nullable)toWindow;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
