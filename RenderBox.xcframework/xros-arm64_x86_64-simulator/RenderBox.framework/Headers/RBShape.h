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
- (void)setStrokedRBPath:(RBPath)path transform:(CGAffineTransform)transform lineWidth:(CGFloat)lineWidth lineCap:(CGLineCap)lineCap lineJoin:(CGLineJoin)lineJoin miterLimit:(CGFloat)miterLimit dashPhase:(CGFloat)dashPhase dashPattern:(const CGFloat *)dashPattern dashCount:(NSInteger)dashCount;
- (void)setStrokedRect:(CGRect)rect lineWidth:(CGFloat)lineWidth;
- (void)setStrokedCircleAtPoint:(CGPoint)point radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth;
- (void)setStrokedRoundedRect:(CGRect)rect cornerRadii:(RBCornerRadii)cornerRadii cornerStyle:(RBPathRoundedCornerStyle)cornerStyle lineWidth:(CGFloat)lineWidth;
- (void)setStrokedRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius cornerStyle:(RBPathRoundedCornerStyle)cornerStyle lineWidth:(CGFloat)lineWidth; 
@end

NS_ASSUME_NONNULL_END
