#import "include/UIView+MySwiftUI.h"
@import _UIKitPrivate;

@implementation UIView (MySwiftUI)

- (void)myswiftui_addManagedInteraction:(id<UIInteraction>)interaction {
    [self addInteraction:interaction];
}

@end

UIView * _UIKitCreateCustomView(Class viewClass, CALayer *layer) {
    return [[[viewClass alloc] _initWithLayer:layer] autorelease];
}
