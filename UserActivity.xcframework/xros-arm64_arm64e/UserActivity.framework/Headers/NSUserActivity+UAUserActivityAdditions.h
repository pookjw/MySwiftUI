#import <Foundation/Foundation.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface NSUserActivity (UAUserActivityAdditions)
@property (getter=_isUniversalLink) BOOL _universalLink;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
