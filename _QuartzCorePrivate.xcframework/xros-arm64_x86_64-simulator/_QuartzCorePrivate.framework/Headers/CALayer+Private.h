#import <QuartzCore/QuartzCore.h>
#import <_QuartzCorePrivate/CAPresentationModifier.h>
#import <_QuartzCorePrivate/CAFilter.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

CG_EXTERN id _Nullable CALayerGetDelegate(CALayer *layer);
CG_EXTERN CALayer * _Nullable CALayerGetSuperlayer(CALayer *layer);

@interface CALayer (Private)
@property BOOL allowsGroupBlending;
@property (copy) NSArray<CAPresentationModifier *> *presentationModifiers;
- (void)addPresentationModifier:(CAPresentationModifier *)arg1 NS_SWIFT_NAME(addPresentationModifier(_:));
- (void)removePresentationModifier:(CAPresentationModifier *)arg1 NS_SWIFT_NAME(removePresentationModifier(_:));
@end

NS_HEADER_AUDIT_END(nullability, sendability)
