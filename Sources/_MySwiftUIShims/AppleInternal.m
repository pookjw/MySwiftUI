#include "include/AppleInternal.h"
#import <Foundation/Foundation.h>
@import _DarwinPrivate;

bool _MySwiftUIIsAppleInternalBuild(void) {
    static bool result;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!os_variant_allows_internal_security_policies("com.apple.SwiftUI")) {
            result = false;
            return;
        }
        
        result = os_variant_has_internal_content("com.apple.SwiftUI");
    });
    return result;
}
