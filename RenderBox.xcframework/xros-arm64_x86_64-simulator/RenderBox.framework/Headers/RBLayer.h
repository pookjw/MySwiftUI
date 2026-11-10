#import <QuartzCore/QuartzCore.h>
#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBLayer : CALayer
@property (nonatomic) BOOL needsSynchronousUpdate;
@property (nonatomic) BOOL rendersAsynchronously;
@property (nonatomic) RBColorMode colorMode;
@property (nonatomic) float displayHeadroomLimit;
@property (nonatomic) NSInteger maxDrawableCount;
@property (nonatomic) BOOL allowsPackedDrawable;
- (void)setPromotesFramebuffer:(BOOL)promotesFramebuffer;
@end

NS_ASSUME_NONNULL_END
