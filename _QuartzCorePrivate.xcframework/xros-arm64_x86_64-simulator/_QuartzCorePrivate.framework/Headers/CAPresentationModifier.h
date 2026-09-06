#import <QuartzCore/QuartzCore.h>
#import <_QuartzCorePrivate/CAPresentationModifierGroup.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CAPresentationModifier : NSObject
@property (readonly, nullable) CAPresentationModifierGroup *group;
@property (retain, nullable) id value;
- (instancetype)initWithKeyPath:(NSString *)keyPath initialValue:(id)value additive:(BOOL)additive group:(CAPresentationModifierGroup * _Nullable)group;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
