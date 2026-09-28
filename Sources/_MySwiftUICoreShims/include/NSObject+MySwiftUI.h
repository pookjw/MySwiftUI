#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MySwiftUI)
+ (BOOL)_isFromMySwiftUI;
+ (const void *)_mySwiftUI_platformViewDefinition;
+ (Class _Nullable)_mySwiftUI_platformColorDefinition;
@end

NS_ASSUME_NONNULL_END
