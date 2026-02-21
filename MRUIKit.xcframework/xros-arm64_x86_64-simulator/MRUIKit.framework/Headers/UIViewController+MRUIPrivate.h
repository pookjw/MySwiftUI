#import <UIKit/UIKit.h>
#import <MRUIKit/MRUIOrnamentsItem.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIViewController (MRUIPrivate)
- (MRUIOrnamentsItem *)mrui_ornamentsItem;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
