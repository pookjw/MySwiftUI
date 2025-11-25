#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MRUIPreferenceHost <NSObject>
@property (nonatomic, readonly, nonnull) NSDictionary<Class, id> *aggregatedPreferences;
- (void)setValue:(id _Nullable)value forPreferenceKey:(Class)key;
- (id _Nullable)aggregatedPreferenceForKey:(Class)key;
- (NSDictionary<Class, id> *)aggregatedPreferences;
@end

@interface UIView (MRUIPrivate) <MRUIPreferenceHost>
@end

NS_ASSUME_NONNULL_END
