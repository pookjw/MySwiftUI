#import <Foundation/Foundation.h>
#import <_CoreServicesPrivate/LSOpenConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSApplicationWorkspace : NSObject
+ (LSApplicationWorkspace * _Nullable)defaultWorkspace;
- (void)openURL:(NSURL *)url configuration:(_LSOpenConfiguration *)configuration completionHandler:(void (^)(NSDictionary * _Nullable, NSError * _Nullable))completionHandler;
@end

NS_ASSUME_NONNULL_END
