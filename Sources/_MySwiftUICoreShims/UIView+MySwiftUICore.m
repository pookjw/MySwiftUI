#import "include/UIView+MySwiftUICore.h"
@import _UIKitPrivate;

@implementation UIView (MySwiftUI)

- (void)myswiftui_insertManagedSubview:(UIView *)subview atIndex:(NSInteger)index {
    [self insertSubview:subview atIndex:index];
}

- (void)myswiftui_addManagedInteraction:(id<UIInteraction>)interaction {
    [self addInteraction:interaction];
}

@end
