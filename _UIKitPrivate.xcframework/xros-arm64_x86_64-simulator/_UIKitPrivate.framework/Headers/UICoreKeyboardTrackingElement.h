#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

NS_SWIFT_UI_ACTOR
@protocol UICoreKeyboardTrackingElement <NSObject>
- (BOOL)prepareKeyboardWithSize:(CGSize)size inWindow:(UIWindow *)window;
- (void)updateKeyboard;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
