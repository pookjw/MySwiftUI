#ifndef CoreView_h
#define CoreView_h

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@import _QuartzCorePrivate;
#import "Defines.h"
#import "ViewSystem.h"

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN id _CAFilterArrayCreate(void) NS_RETURNS_RETAINED;
MSUI_EXTERN void _CAFilterArrayAppend(id, CAFilter *);
MSUI_EXTERN void CoreViewSetFilters(MySwiftUIViewSystem, id /* view */, id);

MSUI_EXTERN void CoreViewAddSubview(MySwiftUIViewSystem toSystem, id toView, MySwiftUIViewSystem fromSystem, id fromView, NSInteger index);
MSUI_EXTERN CALayer * CoreViewLayer(MySwiftUIViewSystem system, id object);
MSUI_EXTERN id CoreViewLayerView(MySwiftUIViewSystem system, CALayer *layer, MySwiftUIViewSystem *outSystem);
MSUI_EXTERN void CoreViewSetShadow(MySwiftUIViewSystem, id, CGColorRef _Nullable, CGFloat radius, CGSize offset);
MSUI_EXTERN NSUInteger CoreViewSubviewsCount(MySwiftUIViewSystem system, id view);
MSUI_EXTERN id CoreViewSubviewAtIndex(MySwiftUIViewSystem system, id view, NSInteger index, MySwiftUIViewSystem *outSystem);
MSUI_EXTERN void CoreViewRemoveFromSuperview(MySwiftUIViewSystem system, id view);

NS_ASSUME_NONNULL_END

#endif
