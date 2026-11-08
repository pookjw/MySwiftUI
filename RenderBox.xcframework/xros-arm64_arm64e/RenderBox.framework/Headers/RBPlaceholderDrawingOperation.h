#import <RenderBox/RBPlaceholderObject.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RBPlaceholderDrawingOperation <RBPlaceholderObject>
@property (readonly, nonatomic) CGRect boundingRect;
@optional
- (void)drawInContext:(CGContextRef)context;
- (void)drawInState:(RBDrawingState)state;
@end

NS_ASSUME_NONNULL_END
