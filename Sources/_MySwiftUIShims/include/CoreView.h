#ifndef CoreView_h
#define CoreView_h

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@import _QuartzCorePrivate;
#import "Defines.h"
#import "ViewSystem.h"

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN id _CAFilterArrayCreate(void) NS_RETURNS_RETAINED;
MSUI_EXTERN void _CAFilterArrayAppend(id array, CAFilter *filter);
MSUI_EXTERN void CoreViewSetFilters(MySwiftUIViewSystem system, id object, id array);

MSUI_EXTERN void CoreViewAddSubview(MySwiftUIViewSystem toSystem, id toView, MySwiftUIViewSystem fromSystem, id fromView, NSInteger index);
MSUI_EXTERN CALayer * CoreViewLayer(MySwiftUIViewSystem system, id object);
MSUI_EXTERN id CoreViewLayerView(MySwiftUIViewSystem system, CALayer *layer, MySwiftUIViewSystem *outSystem);
MSUI_EXTERN void CoreViewSetShadow(MySwiftUIViewSystem system, id object, CGColorRef _Nullable color, CGFloat radius, CGSize offset);
MSUI_EXTERN NSUInteger CoreViewSubviewsCount(MySwiftUIViewSystem system, id object);
MSUI_EXTERN id CoreViewSubviewAtIndex(MySwiftUIViewSystem system, id object, NSInteger index, MySwiftUIViewSystem *outSystem);
MSUI_EXTERN void CoreViewRemoveFromSuperview(MySwiftUIViewSystem system, id object);
MSUI_EXTERN id _Nullable CoreViewMaskView(MySwiftUIViewSystem system, id object);
MSUI_EXTERN void CoreViewSetMaskView3D(MySwiftUIViewSystem toSystem, id toView, MySwiftUIViewSystem fromSystem, id fromView);
MSUI_EXTERN CALayer * _Nullable CoreViewSpeculativeLayer(id object);
MSUI_EXTERN void CoreViewSetNeedsDisplay(MySwiftUIViewSystem system, id layer);
MSUI_EXTERN void CoreViewSetOpacity(MySwiftUIViewSystem system, id object, CGFloat opacity);

NS_ASSUME_NONNULL_END

#endif
