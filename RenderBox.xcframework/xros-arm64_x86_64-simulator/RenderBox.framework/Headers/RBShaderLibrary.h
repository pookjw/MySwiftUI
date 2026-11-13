#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBShaderLibrary : NSObject
+ (RBShaderLibrary *)defaultLibrary;
+ (RBShaderLibrary *)defaultLibraryWithBundle:(NSBundle *)bundle;
@end

NS_ASSUME_NONNULL_END
