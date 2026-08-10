#import <Foundation/Foundation.h>
#import <CoreRE/CoreRE.h>

NS_ASSUME_NONNULL_BEGIN

@class MRUIEntityPreferenceHost;
@protocol MRUIEntityPreferenceHostDelegate <NSObject>
@optional
- (id<MRUIPreferenceHost> _Nullable)overridePreferenceHostForEntity:(REEntityRef)entity;
@end

@interface MRUIEntityPreferenceHost : NSObject <MRUIPreferenceHost>
+ (MRUIEntityPreferenceHost *)preferenceHostForEntity:(REEntityRef)entity;
@property (weak, nonatomic, nullable) id<MRUIEntityPreferenceHostDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
