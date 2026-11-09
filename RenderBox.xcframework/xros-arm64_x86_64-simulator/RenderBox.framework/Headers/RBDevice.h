#import <Foundation/Foundation.h>
#import <RenderBox/RBImageRenderer.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBDevice : NSObject <RBImageRenderer>
@property (class, readonly, nonatomic, getter=isSupported) BOOL supported;
// TODO
@end

NS_ASSUME_NONNULL_END
