#import "include/Safari.h"
#include <dlfcn.h>
#include <objc/runtime.h>
@import SoftLinking;

void * _Nullable SafariServicesLibraryCore(void) {
    static void * _Nullable frameworkLibrary = NULL;
    if (frameworkLibrary == NULL) {
        void *pointer = NULL;
        const char *path = "/System/Library/Frameworks/SafariServices.framework/SafariServices";
        frameworkLibrary = _sl_dlopen(&path, &pointer);
        
        if (frameworkLibrary == NULL) {
            abort();
        }
        
        if (pointer != NULL) {
            free(pointer);
        }
    }
    
    return frameworkLibrary;
}

Class getSFSafariViewControllerClass(void) {
    static Class _Nullable softClass = NULL;
    Class (^block)(void) = ^{
        SafariServicesLibraryCore();
        return objc_lookUpClass("SFSafariViewController");
    };
    
    if (softClass == NULL) {
        softClass = block();
    }
    
    return softClass;
}

__kindof id _makeSafariViewController(NSURL *url) {
    return [[[getSFSafariViewControllerClass() alloc] initWithURL:url] autorelease];
}
