#import <RenderBox/RBPlaceholderObject.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/Defines.h>
#import <RenderBox/RBPlaceholderStyleContent.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RBPlaceholderStyle <RBPlaceholderObject>
- (CGRect)boundingRectForContent:(id<RBPlaceholderStyleContent>)content NS_SWIFT_NAME(boundingRect(for:));
- (void)drawInState:(RBDrawingState)state content:(id<RBPlaceholderStyleContent>)content;
@end

NS_ASSUME_NONNULL_END
