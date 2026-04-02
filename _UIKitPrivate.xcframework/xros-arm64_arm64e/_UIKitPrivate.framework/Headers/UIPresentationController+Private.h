#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UITraitChangeObservableInternal.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIPresentationController (Private) <UITraitChangeObservableInternal>
- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withHandler:(UITraitChangeHandler)handler;
- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withTarget:(id)target action:(SEL)action;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
