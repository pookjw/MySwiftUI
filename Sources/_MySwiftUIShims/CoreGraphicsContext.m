#import "include/CoreGraphicsContext.h"

static thread_local MySwiftUI_CoreGraphicsContext * _Nullable _current = nil;

@implementation MySwiftUI_CoreGraphicsContext {
    MySwiftUI_CoreGraphicsContext * _Nullable _next;
    CGContextRef _ctx;
}
@synthesize CGContext = _ctx;

+ (MySwiftUI_CoreGraphicsContext *)current {
    return _current;
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
