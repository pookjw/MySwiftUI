#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN const UIApplication * _Nullable UIApp NS_SWIFT_UI_ACTOR;

@interface UIApplication (Private)
- (void)_performBlockAfterCATransactionCommits:(void (^)(void))block NS_SWIFT_NAME(_performBlockAfterCATransactionCommits(_:));
@end

NS_HEADER_AUDIT_END(nullability, sendability)
