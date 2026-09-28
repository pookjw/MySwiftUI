#import <UIKit/UIKit.h>
#import "Defines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MySwiftUI)
- (void)myswiftui_insertManagedSubview:(UIView *)subview atIndex:(NSInteger)index;
- (void)myswiftui_addManagedInteraction:(id<UIInteraction>)interaction;
@end

MSUI_EXTERN UIView * _UIKitCreateCustomView(Class viweClass, CALayer *layer);

NS_ASSUME_NONNULL_END
