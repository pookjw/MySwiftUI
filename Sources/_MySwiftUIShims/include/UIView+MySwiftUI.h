//
//  UIView+MySwiftUI.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 11/27/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MySwiftUI)
- (void)myswiftui_insertManagedSubview:(UIView *)subview atIndex:(NSInteger)index;
- (void)myswiftui_addManagedInteraction:(id<UIInteraction>)interaction;
@end

NS_ASSUME_NONNULL_END
