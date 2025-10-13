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
MSUI_EXTERN void CoreViewSetFilters(MySwiftUIViewSystem system, id view, id array);

MSUI_EXTERN void CoreViewAddSubview(MySwiftUIViewSystem toSystem, id toView, MySwiftUIViewSystem fromSystem, id fromView, NSInteger index);
MSUI_EXTERN CALayer * CoreViewLayer(MySwiftUIViewSystem system, id object);
MSUI_EXTERN id CoreViewLayerView(MySwiftUIViewSystem system, CALayer *layer, MySwiftUIViewSystem *outSystem);
MSUI_EXTERN void CoreViewSetShadow(MySwiftUIViewSystem system, id view, CGColorRef _Nullable color, CGFloat radius, CGSize offset);
MSUI_EXTERN NSUInteger CoreViewSubviewsCount(MySwiftUIViewSystem system, id view);
MSUI_EXTERN id CoreViewSubviewAtIndex(MySwiftUIViewSystem system, id view, NSInteger index, MySwiftUIViewSystem *outSystem);
MSUI_EXTERN void CoreViewRemoveFromSuperview(MySwiftUIViewSystem system, id view);
MSUI_EXTERN id _Nullable CoreViewMaskView(MySwiftUIViewSystem system, id view);
MSUI_EXTERN void CoreViewSetMaskView3D(MySwiftUIViewSystem toSystem, id toView, MySwiftUIViewSystem fromSystem, id fromView);

NS_ASSUME_NONNULL_END

#endif
