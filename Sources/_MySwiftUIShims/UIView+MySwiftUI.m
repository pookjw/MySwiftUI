#import "include/UIView+MySwiftUI.h"
@import _UIKitPrivate;

UIView * _UIKitCreateCustomView(Class viewClass, CALayer *layer) {
    return [[[viewClass alloc] _initWithLayer:layer] autorelease];
}
