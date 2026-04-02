#import <UIKit/UIKit.h>
#import <CoreRE/CoreRE.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UIEntityResponder : UIResponder
@property (readonly, nonatomic, nullable) REEntityRef reEntity;
// TODO
@end

NS_HEADER_AUDIT_END(nullability, sendability)
