#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MRUIPreferenceHost <NSObject>
@property (readonly, nonatomic) NSDictionary<Class, id> *aggregatedPreferences;
- (void)setValue:(id _Nullable)value forPreferenceKey:(Class)key;
- (id _Nullable)aggregatedPreferenceForKey:(Class)key;
- (NSArray<id> *)aggregatedPreferences;
@end

NS_ASSUME_NONNULL_END
