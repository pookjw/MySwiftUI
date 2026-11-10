#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBDisplayListInterpolator : NSObject <NSCopying>
- (void)drawInState:(RBDrawingState)state by:(float)scale;
@end

NS_ASSUME_NONNULL_END
