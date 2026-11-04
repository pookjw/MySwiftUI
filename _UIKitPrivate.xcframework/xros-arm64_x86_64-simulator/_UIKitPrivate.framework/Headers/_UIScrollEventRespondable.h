#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UIScrollEvent.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol _UIScrollEventRespondable <NSObject>
- (void)_scrollingChangedWithEvent:(UIScrollEvent *)event NS_SWIFT_NAME(_scrollingChanged(with:));
@end

NS_HEADER_AUDIT_END(nullability, sendability)
