#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBShape : NSObject
@property (nonatomic) RBRenderingMode renderingMode;
@property (nonatomic) CGFloat renderingModeArgument;
@property (nonatomic) BOOL EOFill;
- (void)setInfinite;
- (void)setRect:(CGRect)rect;
- (void)setEllipseInRect:(CGRect)rect;
- (void)setEmpty;
- (void)setRBPath:(RBPath)path transform:(CGAffineTransform)transform;
- (void)setRoundedRect:(CGRect)rect cornerSize:(CGSize)cornerSize cornerStyle:(RBPathRoundedCornerStyle)cornerStyle;
@end

NS_ASSUME_NONNULL_END
