#import <UIKit/UIKit.h>
#import <CoreRE/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface _UIFeedback : NSObject
+ (_UIFeedback * _Nullable)feedbackWithDictionaryRepresentation:(NSDictionary<NSString *, id> *)dictionaryRepresentation;
@property (nonatomic, nullable) REEntityRef entityRef;
- (void)play;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
