#import <Foundation/Foundation.h>
#import <CoreRE/CoreRE.h>
#import <MRUIKit/MRUIEntityPreferenceHost.h>

NS_ASSUME_NONNULL_BEGIN

@class MRUIEntityTraitEnvironment;
@protocol MRUIEntityTraitDelegate <NSObject>
@optional
- (MRUIEntityTraitEnvironment * _Nullable)overrideTraitCollectionForChildEntity:(REEntityRef)childEntity ofEntity:(REEntityRef)entity;
- (void)traitCollectionDidChange:(MRUIEntityTraitEnvironment *)traitEnvironment forEntity:(REEntityRef)entity;
@end

@protocol MRUIEntityTraitDelegatePrivate <MRUIEntityTraitDelegate>
@optional
- (id<MRUIPreferenceHost> _Nullable)overridePreferenceHostForEntity:(REEntityRef)entity;
@end

@interface MRUIEntityTraitEnvironment : NSObject
+ (MRUIEntityTraitEnvironment * _Nullable)traitEnvironmentForEntity:(REEntityRef)entity;
@property (weak, nonatomic, nullable) id<MRUIEntityTraitDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
