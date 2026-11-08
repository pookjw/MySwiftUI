#import <Foundation/Foundation.h>
#import <RenderBox/RBDisplayList.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBEncoderSet : NSObject
- (void)commit;
- (void)addDisplayList:(id<RBDisplayListContents>)contents;
@end

NS_ASSUME_NONNULL_END
