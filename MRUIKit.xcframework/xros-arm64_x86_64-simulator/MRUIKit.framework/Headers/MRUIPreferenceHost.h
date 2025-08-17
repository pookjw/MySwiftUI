#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface MRUIPreferenceHost : NSObject
- (void)setValue:(id _Nullable)value forPreferenceKey:(Class)key;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
