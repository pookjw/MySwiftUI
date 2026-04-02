#import <Foundation/Foundation.h>
#import <BoardServices/BoardServices.h>

NS_ASSUME_NONNULL_BEGIN

@interface _LSOpenConfiguration : NSObject <NSCopying, NSSecureCoding>
@property (nonatomic, getter=isSensitive) BOOL sensitive;
@property (retain, nonatomic, nullable) BSServiceConnectionEndpoint *targetConnectionEndpoint;
@end

NS_ASSUME_NONNULL_END
