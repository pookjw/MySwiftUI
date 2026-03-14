#import "include/UIView+MySwiftUI.h"

@implementation UIView (MySwiftUI)

- (void)myswiftui_insertManagedSubview:(UIView *)subview atIndex:(NSInteger)index {
    [self insertSubview:subview atIndex:index];
}

- (void)myswiftui_addManagedInteraction:(id<UIInteraction>)interaction {
    [self addInteraction:interaction];
}

@end
