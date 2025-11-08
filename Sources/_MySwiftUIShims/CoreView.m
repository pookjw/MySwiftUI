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

Class _uiViewClass(void) {
    static Class __uiViewClass;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __uiViewClass = NSClassFromString(@"UIView");
    });
    return __uiViewClass;
}

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
    
    [toLayer insertSublayer:fromLayer atIndex:(unsigned int)index];
    [toView _invalidateSubviewCache];
}

void CoreViewAddSubview(ViewSystem toSystem, id toView, ViewSystem fromSystem, id fromView, NSInteger index) {
    if (toSystem == ViewSystemCALayer) {
        assert(fromSystem == ViewSystemCALayer);
        [(CALayer *)toView insertSublayer:(CALayer *)fromView atIndex:(unsigned int)index];
    } else if (toSystem == ViewSystemUIView) {
        if (fromView == ViewSystemCALayer) {
            [((UIView *)toView).layer insertSublayer:(CALayer *)fromView atIndex:(unsigned int)index];
        } else {
            _UIKitAddSubview((UIView *)fromView, (UIView *)toView, index);
        }
    }
}

CALayer * CoreViewLayer(ViewSystem system, id object) {
    switch (system) {
        case ViewSystemCALayer:
            return (CALayer *)object;
        case ViewSystemUIView:
        case ViewSystemNSView:
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

void CoreViewSetFilters(ViewSystem system, id object, id array) {
    CALayer *layer;
    switch (system) {
        case ViewSystemCALayer:
            layer = (CALayer *)object;
            break;
        case ViewSystemUIView:
            layer = ((UIView *)object).layer;
            break;
        default:
            return;
    }
    
    layer.filters = array;
}

id CoreViewLayerView(ViewSystem system, CALayer *layer, ViewSystem *outSystem) {
    if (system == ViewSystemCALayer) {
        *outSystem = ViewSystemCALayer;
        return layer;
    } else {
        id _Nullable delegate = CALayerGetDelegate(layer);
        
        if (system != ViewSystemUIView) {
            *outSystem = ViewSystemCALayer;
            return layer;
        }
        
        if (![delegate isKindOfClass:_uiViewClass()]) {
            *outSystem = ViewSystemCALayer;
            return layer;
        }
        
        *outSystem = ViewSystemUIView;
        return delegate;
    }
}

void CoreViewSetShadow(ViewSystem system, id object, CGColorRef _Nullable color, CGFloat radius, CGSize offset) {
    CALayer *layer;
    switch (system) {
        case ViewSystemCALayer:
            layer = (CALayer *)object;
            break;
        case ViewSystemUIView:
            layer = ((UIView *)object).layer;
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

NSUInteger CoreViewSubviewsCount(ViewSystem system, id object) {
    CALayer *layer;
    switch (system) {
        case ViewSystemCALayer:
            layer = (CALayer *)object;
            break;
        case ViewSystemUIView:
            layer = ((UIView *)object).layer;
        default:
            return 0;
    }
    
    return layer.sublayers.count;
}

id CoreViewSubviewAtIndex(ViewSystem system, id object, NSInteger index, ViewSystem *outSystem) {
    switch (system) {
        case ViewSystemCALayer: {
            CALayer *layer = (CALayer *)object;
            CALayer *sublayer = layer.sublayers[index];
            return CoreViewLayerView(system, sublayer, outSystem);
        }
        case ViewSystemUIView:
            CALayer *layer = ((UIView *)object).layer;
            CALayer *sublayer = layer.sublayers[index];
            return CoreViewLayerView(system, sublayer, outSystem);
        default:
            return (id)system;
    }
}

void CoreViewRemoveFromSuperview(ViewSystem system, id object) {
    switch (system) {
        case ViewSystemCALayer:
            [(CALayer *)object removeFromSuperlayer];
            break;
        case ViewSystemUIView:
        case ViewSystemNSView:
#if TARGET_OS_IPHONE
            [(UIView *)object removeFromSuperview];
#elif TARGET_OS_OSX
            [(UIView *)object removeFromSuperview];
#endif
            break;
    }
}

id _Nullable CoreViewMaskView(ViewSystem system, id object) {
    switch (system) {
        case ViewSystemCALayer:
            return ((CALayer *)object).mask;
        case ViewSystemUIView:
            return ((UIView *)object).maskView;
        default:
            return (id)system;
    }
}

void CoreViewSetMaskView3D(ViewSystem toSystem, id toView, ViewSystem fromSystem, id fromView) {
    if (toSystem == ViewSystemCALayer) {
        assert(fromSystem == ViewSystemCALayer);
        ((CALayer *)fromView).mask = (CALayer *)toView;
    } else if (toSystem == ViewSystemUIView) {
        if (fromSystem == ViewSystemCALayer) {
            ((UIView *)fromView).layer.mask = (CALayer *)toView;
        } else {
            assert(fromSystem == ViewSystemUIView);
            ((UIView *)fromView).maskView = (UIView *)fromView;
        }
    }
}

CALayer * _Nullable CoreViewSpeculativeLayer(id object) {
    if ([object isKindOfClass:[CALayer class]]) {
        return (CALayer *)object;
    } else if ([object isKindOfClass:_uiViewClass()]) {
        return ((UIView *)object).layer;
    } else {
        return nil;
    }
}

void CoreViewSetNeedsDisplay(ViewSystem system, id layer) {
    if (system == ViewSystemCALayer) {
        [layer setNeedsDisplay];
    }
}

void CoreViewSetOpacity(ViewSystem system, id object, CGFloat opacity) {
    switch (system) {
        case ViewSystemCALayer:
            ((CALayer *)object).opacity = opacity;
            break;
        case ViewSystemUIView:
            ((UIView *)object).alpha = opacity;
            break;
        default:
            break;
    }
}
