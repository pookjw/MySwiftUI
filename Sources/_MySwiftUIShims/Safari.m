#import "include/Safari.h"
#include <dlfcn.h>
#include <objc/runtime.h>
@import SoftLinking;

extern void abort_report_np(const char *, ...);

void * _Nullable SafariServicesLibraryCore(void) {
    static void * _Nullable frameworkLibrary = NULL;
    if (frameworkLibrary == NULL) {
        void *pointer = NULL;
        const char *paths[] = { "/System/Library/Frameworks/SafariServices.framework/SafariServices", NULL, NULL };
        frameworkLibrary = _sl_dlopen(paths, &pointer);
        
        if (frameworkLibrary == NULL) {
            abort_report_np("%s", (const char *)pointer);
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
        Class result = objc_getClass("SFSafariViewController");
        if (result == NULL) {
            abort_report_np("Unable to find class %s", "SFSafariViewController");
        }
        return result;
    };
    
    if (softClass == NULL) {
        softClass = block();
    }
    
    return softClass;
}

__kindof id _makeSafariViewController(NSURL *url) {
    return [[[getSFSafariViewControllerClass() alloc] initWithURL:url] autorelease];
}
