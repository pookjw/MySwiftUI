#ifndef CoreViewFunctions_h
#define CoreViewFunctions_h

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
@import _QuartzCorePrivate;
@import _UIKitPrivate;
#import "Defines.h"
#import "ViewSystem.h"

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN id _CAFilterArrayCreate(void) NS_RETURNS_RETAINED;
MSUI_EXTERN void _CAFilterArrayAppend(id array, CAFilter *filter);
MSUI_EXTERN void CoreViewSetFilters(ViewSystem system, id object, id array);

MSUI_EXTERN void CoreViewAddSubview(ViewSystem toSystem, id toView, ViewSystem fromSystem, id fromView, NSInteger index);
MSUI_EXTERN CALayer * CoreViewLayer(ViewSystem system, id object);
MSUI_EXTERN id CoreViewLayerView(ViewSystem system, CALayer *layer, ViewSystem *outSystem);
MSUI_EXTERN void CoreViewSetShadow(ViewSystem system, id object, CGColorRef _Nullable color, CGFloat radius, CGSize offset);
MSUI_EXTERN NSUInteger CoreViewSubviewsCount(ViewSystem system, id object);
MSUI_EXTERN id CoreViewSubviewAtIndex(ViewSystem system, id object, NSInteger index, ViewSystem *outSystem);
MSUI_EXTERN void CoreViewRemoveFromSuperview(ViewSystem system, id object);
MSUI_EXTERN id _Nullable CoreViewMaskView(ViewSystem system, id object);
MSUI_EXTERN void CoreViewSetMaskView3D(ViewSystem toSystem, id toView, ViewSystem fromSystem, id fromView);
MSUI_EXTERN CALayer * _Nullable CoreViewSpeculativeLayer(id object);
MSUI_EXTERN void CoreViewSetNeedsDisplay(ViewSystem system, id layer);
MSUI_EXTERN void CoreViewSetOpacity(ViewSystem system, id object, CGFloat opacity);
MSUI_EXTERN void CoreViewSetClipsToBounds(ViewSystem system, id object, BOOL clipToBounds, BOOL toLayer);
MSUI_EXTERN void CoreViewSetSize(ViewSystem system, id object, CGSize size);
MSUI_EXTERN void CoreViewSetMaskGeometry(ViewSystem system, id object, CGRect rect);
MSUI_EXTERN void CoreViewSetTransform(ViewSystem system, id object, CGAffineTransform transform);
MSUI_EXTERN void CoreViewSetGeometry(ViewSystem system, id object, BOOL isPlatformView, BOOL flag3, BOOL originChanged, BOOL flag5, CGPoint point, CGRect bounds);
MSUI_EXTERN void CoreViewSetUsesPerspectiveCorrectRendering(ViewSystem system, id object, BOOL flag);
MSUI_EXTERN void CoreViewSetPreferredGroundingShadowVisibility(ViewSystem system, id object, _UIPlatterGroundingShadowVisibility visibility);
MSUI_EXTERN void CoreViewSetSwiftUIServerResponderID(ViewSystem system, id object, NSUInteger responderID);

NS_ASSUME_NONNULL_END

#endif
