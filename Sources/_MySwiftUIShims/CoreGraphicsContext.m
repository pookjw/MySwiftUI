#import "include/CoreGraphicsContext.h"

@implementation MySwiftUI_CoreGraphicsContext {
    MySwiftUI_CoreGraphicsContext * _Nullable _next;
    CGContextRef _ctx;
}
@synthesize CGContext = _ctx;

+ (MySwiftUI_CoreGraphicsContext *)current {
    abort();
}

- (instancetype)initWithCGContext:(CGContextRef)context {
    abort();
}

- (BOOL)__createsImages {
    abort();
}

- (void)pop {
    abort();
}

- (void)push {
    abort();
}

@end
