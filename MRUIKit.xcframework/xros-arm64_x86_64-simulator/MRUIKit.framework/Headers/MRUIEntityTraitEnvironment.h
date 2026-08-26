#import <Foundation/Foundation.h>
#import <CoreRE/CoreRE.h>
#import <MRUIKit/MRUIEntityPreferenceHost.h>

NS_ASSUME_NONNULL_BEGIN

@class MRUIEntityTraitEnvironment;
@protocol MRUIEntityTraitDelegate <NSObject>
@optional
- (MRUIEntityTraitEnvironment * _Nullable)overrideTraitCollectionForChildEntity:(REEntity)childEntity ofEntity:(REEntity)entity;
- (void)traitCollectionDidChange:(MRUIEntityTraitEnvironment *)traitEnvironment forEntity:(REEntity)entity;
@end

@protocol MRUIEntityTraitDelegatePrivate <MRUIEntityTraitDelegate>
@optional
- (id<MRUIPreferenceHost> _Nullable)overridePreferenceHostForEntity:(REEntity)entity;
@end

@interface MRUIEntityTraitEnvironment : NSObject
+ (MRUIEntityTraitEnvironment * _Nullable)traitEnvironmentForEntity:(REEntity)entity;
@property (weak, nonatomic, nullable) id<MRUIEntityTraitDelegate> delegate;
- (void)_dirtyTraitCollection;
@end

NS_ASSUME_NONNULL_END
