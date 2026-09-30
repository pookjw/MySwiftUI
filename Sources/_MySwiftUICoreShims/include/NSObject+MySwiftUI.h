#import <Foundation/Foundation.h>

@class UIView;

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MySwiftUI)
- (void)myswiftui_insertManagedSubview:(UIView *)subview atIndex:(NSInteger)index;
+ (BOOL)_isFromMySwiftUI;
+ (const void * _Nullable)_mySwiftUI_platformViewDefinition;
+ (Class _Nullable)_mySwiftUI_platformColorDefinition;
@end

NS_ASSUME_NONNULL_END
