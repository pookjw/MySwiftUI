#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MRUIPreferenceHost <NSObject>
@property (nonatomic, readonly, nonnull) NSDictionary<Class, id> *aggregatedPreferences;
- (void)setValue:(id _Nullable)value forPreferenceKey:(Class)key;
- (id _Nullable)aggregatedPreferenceForKey:(Class)key;
- (NSDictionary<Class, id> *)aggregatedPreferences;
@end

@protocol MRUIPreferenceHostConformer <MRUIPreferenceHost>
@property (readonly, nonatomic) id<MRUIPreferenceHost> parentPreferenceHost;
- (void)descendant:(id)arg1 changedToValue:(id)arg2 forPreferenceKey:(Class)arg3;
- (id)parentPreferenceHost;
@end

@interface UIView (MRUIPrivate) <MRUIPreferenceHost>
@end

@interface MRUIPreferenceHost : NSObject <MRUIPreferenceHost>
@end

NS_ASSUME_NONNULL_END
