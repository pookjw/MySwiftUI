#ifndef CoreView_h
#define CoreView_h

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@import _QuartzCorePrivate;
#import "Defines.h"
#import "ViewSystem.h"

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN id _CAFilterArrayCreate(void);
MSUI_EXTERN void _CAFilterArrayAppend(id, CAFilter *);
MSUI_EXTERN void CoreViewSetFilters(MySwiftUIViewSystem, id /* view */, id);

MSUI_EXTERN void CoreViewAddSubview(MySwiftUIViewSystem, id, MySwiftUIViewSystem, id, unsigned int);
MSUI_EXTERN CALayer * CoreViewLayer(MySwiftUIViewSystem system, id object);
MSUI_EXTERN id CoreViewLayerView(MySwiftUIViewSystem, CALayer *, BOOL *);
MSUI_EXTERN void CoreViewSetShadow(MySwiftUIViewSystem, id, CGColorRef _Nullable, CGFloat radius, CGSize offset);
MSUI_EXTERN NSUInteger CoreViewSubviewsCount(MySwiftUIViewSystem, id);
MSUI_EXTERN id CoreViewSubviewAtIndex(MySwiftUIViewSystem, id, NSUInteger);

NS_ASSUME_NONNULL_END

#endif
