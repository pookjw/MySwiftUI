#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol _UITraitTokenProtocol <NSObject, NSCopying>
@end

@protocol UITraitChangeObservableInternal <UITraitChangeObservable>
- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withHandler:(UITraitChangeHandler)handler;
- (id<UITraitChangeRegistration>)_registerForTraitTokenChanges:(NSArray<id<_UITraitTokenProtocol>> *)changes withTarget:(id)target action:(SEL)action;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
