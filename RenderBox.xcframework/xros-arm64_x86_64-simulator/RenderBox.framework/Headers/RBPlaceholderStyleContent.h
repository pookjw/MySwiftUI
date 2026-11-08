#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RBPlaceholderStyleContent <NSObject>
@property (readonly, nonatomic) RBUUID styleNamespace;
@property (readonly, nonatomic) uint32_t styleIdentifier;
@property (readonly, nonatomic) RBUUID itemNamespace;
@property (readonly, nonatomic) uint32_t itemIdentifier;
@property (nonatomic) float alpha;
@property (nonatomic) RBBlendMode blendMode;
@property (readonly, nonatomic) CGRect boundingRect;
- (void)drawInState:(RBDrawingState)state alpha:(float)alpha;
- (void)drawCopyInState:(RBDrawingState)state alpha:(float)alpha;
@end

NS_ASSUME_NONNULL_END
