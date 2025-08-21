#import "CoreGlue2.h"
#include <dlfcn.h>
#include <mach-o/dyld.h>
#include "include/Utils.h"

extern void abort_report_np(const char *, ...);

Class __getMySwiftUIGlue2ClassSymbolLoc() {
    static Class _Nullable ptr = nil;
    
    void (^get)(void) = ^{
        // original : _sl_dlopen(const char **, os_log_t)
        bool found;
        uint32_t idx = __getMySwiftUIImageIndex(&found);
        assert(found);
        
        const char *name = _dyld_get_image_name(idx);
        int result = strcmp(name, "MySwiftUI");
        if ((result == 0) || (result == 1)) {
            void *handle = dlopen(name, RTLD_NOW);
            void *sym = dlsym(handle, "MySwiftUIGlue2Class");
            if (sym != NULL) {
                ptr = ((Class (*)(void))sym)();
            }
        }
        
        assert(ptr != nil);
    };
    
    if (ptr == nil) {
        get();
    }
    
    return ptr;
}

id _initializeMyCoreGlue2(void) {
    return [[[__getMySwiftUIGlue2ClassSymbolLoc() alloc] init] autorelease];
}
