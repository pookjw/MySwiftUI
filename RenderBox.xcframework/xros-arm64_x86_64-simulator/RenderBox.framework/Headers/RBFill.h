#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/Defines.h>
#import <RenderBox/RBShader.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBFill : NSObject
@property (nonatomic) float headroom;
- (void)setColor:(RBColor)color;
- (void)concat:(CGAffineTransform)ctm;
- (void)setAxialGradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint stopCount:(NSInteger)stopCount colors:(const RBColor *)colors locations:(const CGFloat * _Nullable)locations flags:(RBGradientFlags)flags;
- (void)setColor:(RBColor)color colorSpace:(RBColorSpace)colorSpace;
- (void)setRadialGradientCenter:(CGPoint)center startRadius:(CGFloat)startRadius endRadius:(CGFloat)endRadius stopCount:(NSInteger)stopCount colors:(const RBColor *)colors locations:(const CGFloat * _Nullable)locations flags:(RBGradientFlags)flags;
- (void)setConicGradientCenter:(CGPoint)center angle:(CGFloat)angle stopCount:(NSInteger)stopCount colors:(const RBColor *)colors locations:(const CGFloat * _Nullable)locations flags:(RBGradientFlags)flags;
- (void)setConicGradientCenter:(CGPoint)center angle:(CGFloat)angle stopCount:(NSInteger)stopCount colors:(const RBColor *)colors colorSpace:(RBColorSpace)colorSpace locations:(const CGFloat * _Nullable)locations flags:(RBGradientFlags)flags;
- (void)setAngularGradientCenter:(CGPoint)center startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle stopCount:(NSInteger)stopCount colors:(const RBColor *)colors colorSpace:(RBColorSpace)colorSpace locations:(const CGFloat * _Nullable)locations flags:(RBGradientFlags)flags;
- (void)setRadialGradientStartCenter:(CGPoint)startCenter startRadius:(CGFloat)startRadius endCenter:(CGPoint)endCenter endRadius:(CGFloat)endRadius stopCount:(NSInteger)stopCount colors:(const RBColor *)colors locations:(const CGFloat * _Nullable)locations flags:(RBGradientFlags)flags;
- (void)setMeshGradientType:(RBMeshGradientType)meshGradientType positions:(const float *)positions colors:(const RBColor *)colors count:(NSUInteger)count width:(NSUInteger)width background:(RBColor)background colorSpace:(RBColorSpace)colorSpace flags:(RBMeshGradientFlags)flags;
- (void)setShader:(RBShader * _Nullable)shader bounds:(const CGRect *)bounds flags:(RBShaderFlags)flags;
@end

NS_ASSUME_NONNULL_END
