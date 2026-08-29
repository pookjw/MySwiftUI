#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSThread (Private)
- (BOOL)startAndReturnError:(NSError * _Nullable __autoreleasing * _Nullable)error;
@end

NS_ASSUME_NONNULL_END