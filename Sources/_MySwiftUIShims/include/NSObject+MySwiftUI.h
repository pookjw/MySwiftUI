//
//  NSObject+MySwiftUI.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 8/21/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MySwiftUI)
+ (const void *)_mySwiftUI_platformViewDefinition;
- (void)myswiftui_insertManagedSubview:(id)subview atIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
