#import <Foundation/Foundation.h>
#import <MRUIKit/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@class MRUIPlatterOrnament;

MRUI_EXTERN NSNotificationName const _MRUIPlatterOrnamentManagerDidAddOrnamentNotification NS_SWIFT_NONISOLATED;
MRUI_EXTERN NSNotificationName const _MRUIPlatterOrnamentManagerDidRemoveOrnamentNotification NS_SWIFT_NONISOLATED;

@interface MRUIPlatterOrnamentManager : NSObject
- (NSArray<MRUIPlatterOrnament *> *)_ornamentsIncludingInternalOrnaments:(BOOL)includeInternalOrnaments;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
