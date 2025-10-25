#import <_QuartzCorePrivate/CARemoteEffect.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface CATransactionCompletionItem : NSObject
+ (CATransactionCompletionItem * _Nullable)completionItem;
- (void)invalidate;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
