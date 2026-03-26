#import <UIKit/UIKit.h>
#import <MRUIKit/MRUIPlatterOrnament.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIWindow (MRUIPrivate)
- (MRUIPlatterOrnament * _Nullable)mrui_ornament;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
