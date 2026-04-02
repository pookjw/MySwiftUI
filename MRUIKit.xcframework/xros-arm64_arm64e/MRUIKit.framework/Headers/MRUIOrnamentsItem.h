#import <Foundation/Foundation.h>
#import <MRUIKit/MRUIPlatterOrnament.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface MRUIOrnamentsItem : NSObject
@property (copy, nonatomic) NSArray<MRUIPlatterOrnament *> *ornaments;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
