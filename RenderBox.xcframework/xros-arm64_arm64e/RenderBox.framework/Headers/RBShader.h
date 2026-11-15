#import <Foundation/Foundation.h>
#import <RenderBox/RBShaderLibrary.h>
#import <RenderBox/Defines.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBShader : NSObject
@property (readonly, nonatomic) NSUInteger numberOfArguments;
- (instancetype)initWithLibrary:(RBShaderLibrary * _Nullable)library function:(NSString *)function;
- (RBArgument)argumentAtIndex:(NSUInteger)index;
- (void)setArgumentBytes:(const void *)bytes atIndex:(NSUInteger)index type:(RBArgumentValueType)type count:(NSUInteger)count flags:(RBCustomShaderFlags)flags;
- (void)setArgumentColorSpace:(RBColorSpace)colorSpace atIndex:(NSUInteger)index;
- (void)setArgumentHeadroom:(float)headroom atIndex:(NSUInteger)index;
- (void)setArgumentData:(NSData *)data atIndex:(NSUInteger)index type:(RBArgumentValueType)type flags:(RBCustomShaderFlags)flags;
@end

NS_ASSUME_NONNULL_END
