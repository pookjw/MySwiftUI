#include "private/Utils.h"
#include <mach-o/dyld.h>
#include <string.h>
#include <stdio.h>
#include <execinfo.h>
#include <dlfcn.h>
#include <assert.h>

void * __getMySwiftUIImageHandle(void) {
    uint32_t count = _dyld_image_count();
    
    const char *name = NULL;
    for (uint32_t idx = 0; idx < count; idx++) {
        const char *_name = _dyld_get_image_name(idx);
        int result = strcmp(_name, "MySwiftUI");
        if ((result == 0) || (result == 1)) {
            name = _name;
            break;
        }
    }
    
    if (name == NULL) {
        void *buffer[1];
        int btCount = backtrace(buffer, 1);
        
        if (btCount != 1) {
            return NULL;
        }
        
        struct dl_info info;
        assert(dladdr(buffer[0], &info) != 0);
        
        for (uint32_t idx = 0; idx < count; idx++) {
            const char *name = _dyld_get_image_name(idx);
            printf("%s\n", name);
            int result = strcmp(name, info.dli_fname);
            if (result == 0) {
                return info.dli_fbase;
            }
        }
    } else {
        return dlopen(name, RTLD_NOW);
    }
}
