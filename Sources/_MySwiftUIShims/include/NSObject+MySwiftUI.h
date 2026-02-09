//
//  NSObject+MySwiftUI.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 8/21/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MySwiftUI)
+ (BOOL)_isFromMySwiftUI;
+ (const void *)_mySwiftUI_platformViewDefinition;
@end

NS_ASSUME_NONNULL_END
