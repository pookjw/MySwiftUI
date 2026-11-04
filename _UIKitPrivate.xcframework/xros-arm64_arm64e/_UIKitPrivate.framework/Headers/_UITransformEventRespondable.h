#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UITransformEvent.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol _UITransformEventRespondable <NSObject>
- (void)_transformChangedWithEvent:(UITransformEvent *)event NS_SWIFT_NAME(_transformChanged(with:));
@end

NS_HEADER_AUDIT_END(nullability, sendability)
