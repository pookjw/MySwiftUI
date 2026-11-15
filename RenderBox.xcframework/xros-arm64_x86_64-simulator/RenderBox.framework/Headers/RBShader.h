#import <Foundation/Foundation.h>
#import <RenderBox/RBShaderLibrary.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBShader : NSObject
- (instancetype)initWithLibrary:(RBShaderLibrary *)library function:(NSString *)function;
@end

NS_ASSUME_NONNULL_END
