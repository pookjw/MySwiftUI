#import "include/UIColor+MySwiftUI.h"

#import "include/UIView+MySwiftUI.h"

@implementation UIColor (MySwiftUI)

- (instancetype)initWithColor__mySwiftUI__:(id)color {
    [color retain];
    [self release];
    self = color;
    return self;
}

@end
