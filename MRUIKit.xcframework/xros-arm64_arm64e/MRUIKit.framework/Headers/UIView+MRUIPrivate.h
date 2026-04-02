#import <UIKit/UIKit.h>
#import <MRUIKit/MRUIPreferenceHost.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIView (MRUIPrivate)
@property (nonatomic, readonly, nullable) id<MRUIPreferenceHost> parentPreferenceHost;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
