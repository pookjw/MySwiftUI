//
//  NSObject+MySwiftUI.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 8/21/25.
//

#import "include/NSObject+MySwiftUI.h"
#include <dlfcn.h>
#include <pthread.h>
#include "private/Utils.h"
#import <UIKit/UIKit.h>

@implementation NSObject (MySwiftUI)

+ (const void *)_mySwiftUI_platformViewDefinition {
//    if (!pthread_main_np()) return NULL;
//    
//    static void *swiftui_binary = NULL;
//    if (swiftui_binary == NULL) {
//        swiftui_binary = dlopen("/System/Library/Frameworks/SwiftUI.framework/SwiftUI", RTLD_NOW);
//        
//        return [self _mySwiftUI_platformViewDefinition];
//    } else {
//        return NULL;
//    }
    
    if (!pthread_main_np()) return NULL;
    
    static bool found;
    __block bool once = false;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        found = (__getMySwiftUIImageHandle() != NULL);
        once = true;
    });
    assert(found);
    
    if (once) {
        return [self _mySwiftUI_platformViewDefinition];
    } else {
        return NULL;
    }
}

- (void)myswiftui_insertManagedSubview:(id)subview atIndex:(NSInteger)index {
    [(UIView *)self insertSubview:subview atIndex:index];
}

@end
