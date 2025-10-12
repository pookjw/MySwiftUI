#include "include/CoreView.h"
#include <TargetConditionals.h>
#include <objc/NSObjCRuntime.h>
#import "include/NSObject+MySwiftUI.h"
@import _UIKitPrivate;

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

#if TARGET_OS_OSX
#import <Cocoa/Cocoa.h>
#endif

void _UIKitAddSubview(UIView *fromView, UIView *toView, NSInteger index) {
    /*
     fromView = x25
     toView = x19
     index = x21
     */
    // x20
    CALayer *toLayer = toView.layer;
    // x23
    NSArray<CALayer *> *sublayers = toView.layer.sublayers;
    // x22
    NSUInteger count;
    if (sublayers == nil) {
        count = 0;
    } else {
        count = sublayers.count;
    }
    
    // x24
    CALayer *fromLayer = fromView.layer;
    
    if (index < count) {
        if (sublayers[index] == fromLayer) return;
    }
    
    fromLayer = CALayerGetSuperlayer(fromLayer);
    if (toLayer != fromLayer) {
        [toView myswiftui_insertManagedSubview:fromView atIndex:index];
        return;
    }
    
    if ((index + 1) < count) {
        if (sublayers[index + 1] == fromLayer) {
            fromLayer = sublayers[index];
        }
    }
    
    [toLayer insertSublayer:fromLayer atIndex:index];
    [toView _invalidateSubviewCache];
}

void CoreViewAddSubview(MySwiftUIViewSystem toSystem, id toView, MySwiftUIViewSystem fromSystem, id fromView, NSInteger index) {
    if (toSystem == MySwiftUIViewSystemCALayer) {
        assert(fromSystem == MySwiftUIViewSystemCALayer);
        [(CALayer *)toView insertSublayer:(CALayer *)fromView atIndex:index];
    } else if (toSystem == MySwiftUIViewSystemUIView) {
        if (fromView == MySwiftUIViewSystemCALayer) {
            [((UIView *)toView).layer insertSublayer:(CALayer *)fromView atIndex:index];
        } else {
            _UIKitAddSubview((UIView *)fromView, (UIView *)toView, index);
        }
    }
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
    CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
}

void _CAFilterArrayAppend(id array, CAFilter *filter) {
    CFArrayAppendValue((CFMutableArrayRef)array, (const void *)filter);
}

void CoreViewSetFilters(MySwiftUIViewSystem system, id view, id array) {
    CALayer *layer;
    switch (system) {
        case MySwiftUIViewSystemCALayer:
            layer = (CALayer *)view;
            break;
        case MySwiftUIViewSystemUIView:
            layer = ((UIView *)view).layer;
            break;
        default:
            return;
    }
    
    layer.filters = array;
}

id CoreViewLayerView(MySwiftUIViewSystem system, CALayer *layer, MySwiftUIViewSystem *outSystem) {
    if (system == MySwiftUIViewSystemCALayer) {
        *outSystem = MySwiftUIViewSystemCALayer;
        return layer;
    } else {
        id _Nullable delegate = CALayerGetDelegate(layer);
        
        if (system != MySwiftUIViewSystemUIView) {
            *outSystem = MySwiftUIViewSystemCALayer;
            return layer;
        }
        
        static Class __uiViewClass;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            __uiViewClass = NSClassFromString(@"UIView");
        });
        
        if (![delegate isKindOfClass:__uiViewClass]) {
            *outSystem = MySwiftUIViewSystemCALayer;
            return layer;
        }
        
        *outSystem = MySwiftUIViewSystemUIView;
        return delegate;
    }
}

void CoreViewSetShadow(MySwiftUIViewSystem system, id view, CGColorRef _Nullable color, CGFloat radius, CGSize offset) {
    CALayer *layer;
    switch (system) {
        case MySwiftUIViewSystemCALayer:
            layer = (CALayer *)view;
            break;
        case MySwiftUIViewSystemUIView:
            layer = ((UIView *)view).layer;
            break;
        default:
            return;
    }
    
    if (color != NULL) {
        layer.shadowOpacity = 1.f;
        layer.shadowColor = color;
        layer.shadowRadius = radius;
        layer.shadowOffset = offset;
    } else {
        layer.shadowOpacity = 0.f;
    }
}

NSUInteger CoreViewSubviewsCount(MySwiftUIViewSystem system, id view) {
    CALayer *layer;
    switch (system) {
        case MySwiftUIViewSystemCALayer:
            layer = (CALayer *)view;
            break;
        case MySwiftUIViewSystemUIView:
            layer = ((UIView *)view).layer;
        default:
            return 0;
    }
    
    return layer.sublayers.count;
}

id CoreViewSubviewAtIndex(MySwiftUIViewSystem system, id view, NSInteger index, MySwiftUIViewSystem *outSystem) {
    switch (system) {
        case MySwiftUIViewSystemCALayer: {
            CALayer *layer = (CALayer *)view;
            CALayer *sublayer = layer.sublayers[index];
            return CoreViewLayerView(system, sublayer, outSystem);
        }
        case MySwiftUIViewSystemUIView:
            CALayer *layer = ((UIView *)view).layer;
            CALayer *sublayer = layer.sublayers[index];
            return CoreViewLayerView(system, sublayer, outSystem);
        default:
            return (id)system;
    }
}

void CoreViewRemoveFromSuperview(MySwiftUIViewSystem system, id view) {
    switch (system) {
        case MySwiftUIViewSystemCALayer:
            [(CALayer *)view removeFromSuperlayer];
            break;
        case MySwiftUIViewSystemUIView:
        case MySwiftUIViewSystemNSView:
#if TARGET_OS_IPHONE
            [(UIView *)view removeFromSuperview];
#elif TARGET_OS_OSX
            [(UIView *)view removeFromSuperview];
#endif
            break;
    }
}
