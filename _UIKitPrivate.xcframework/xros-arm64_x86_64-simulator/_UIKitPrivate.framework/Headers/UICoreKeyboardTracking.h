#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UICoreKeyboardTrackingElement.h>
#import <_UIKitPrivate/UIKeyboardSceneDelegate.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

NS_SWIFT_UI_ACTOR
@interface UICoreKeyboardTracking : NSObject
+ (void)removeTrackingElement:(id<UICoreKeyboardTrackingElement>)element window:(UIWindow *)window keyboardDelegate:(UIKeyboardSceneDelegate *)keyboardSceneDelegate;
+ (void)addTrackingElement:(id<UICoreKeyboardTrackingElement>)element window:(UIWindow *)window keyboardDelegate:(UIKeyboardSceneDelegate *)keyboardSceneDelegate;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
