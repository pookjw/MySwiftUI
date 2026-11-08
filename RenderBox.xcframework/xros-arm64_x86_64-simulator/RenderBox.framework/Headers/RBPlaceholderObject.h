#import <Foundation/Foundation.h>
#import <RenderBox/RBEncoderDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RBPlaceholderObject <NSObject>
@property (readonly, copy, nonatomic, nullable) NSString *identifier;
- (NSData * _Nullable)encodedDataWithDelegate:(id<RBEncoderDelegate> _Nullable)delegate error:(NSError * _Nullable __autoreleasing * _Nullable)error NS_SWIFT_NAME(encodedData(delegate:));
@end

NS_ASSUME_NONNULL_END
