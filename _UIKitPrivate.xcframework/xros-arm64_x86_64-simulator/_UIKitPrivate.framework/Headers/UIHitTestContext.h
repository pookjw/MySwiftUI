#import <UIKit/UIKit.h>
#import <CoreRE/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UIHitTestContext : NSObject
@end

UIKIT_EXTERN _UIHitTestContext * _Nullable _UICurrentHitTestContext(void);

NS_HEADER_AUDIT_END(nullability, sendability)
