#include "include/CoreView.h"
#include <TargetConditionals.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

#if TARGET_OS_OSX
#import <Cocoa/Cocoa.h>
#endif

void CoreViewAddSubview(MySwiftUIViewSystem, id, MySwiftUIViewSystem, id, unsigned int) {
    abort();
}

CALayer * CoreViewLayer(MySwiftUIViewSystem system, id object) {
    switch (system) {
        case MySwiftUIViewSystemCALayer:
            return (CALayer *)object;
        case MySwiftUIViewSystemUIView:
        case MySwiftUIViewSystemNSView:
#if TARGET_OS_IPHONE
            return ((UIView *)object).layer;
#elif TARGET_OS_OSX
            return ((NSView *)object).layer;
#endif
    }
}

id _CAFilterArrayCreate(void) {
    abort();
}

void _CAFilterArrayAppend(id, CAFilter *) {
    abort();
}

void CoreViewSetFilters(MySwiftUIViewSystem, id /* view */, id) {
    abort();
}

id CoreViewLayerView(MySwiftUIViewSystem, CALayer *, BOOL *) {
    abort();
}

void CoreViewSetShadow(MySwiftUIViewSystem, id, CGColorRef _Nullable, CGFloat radius, CGSize offset) {
    abort();
}
