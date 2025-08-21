#include "include/Utils.h"
#include <mach-o/dyld.h>
#include <string.h>
#include <stdio.h>
#include <execinfo.h>
#include <dlfcn.h>
#include <assert.h>

uint32_t __getMySwiftUIImageIndex(bool * _Nullable found) {
    uint32_t count = _dyld_image_count();
    for (uint32_t idx = 0; idx < count; idx++) {
        const char *name = _dyld_get_image_name(idx);
        int result = strcmp(name, "MySwiftUI");
        if ((result == 0) || (result == 1)) {
            if (found != NULL) {
                *found = true;
            }
            return idx;
        }
    }
    
    void *buffer[1];
    int btCount = backtrace(buffer, 1);
    
    if (btCount != 1) {
        if (found != NULL) {
            *found = false;
        }
        return 0;
    }
    
    struct dl_info info;
    assert(dladdr(buffer[0], &info) != 0);
    
    for (uint32_t idx = 0; idx < count; idx++) {
        const char *name = _dyld_get_image_name(idx);
        int result = strcmp(name, info.dli_fname);
        if (result == 0) {
            if (found != NULL) {
                *found = true;
            }
            return idx;
        }
    }
    
    if (found != NULL) {
        *found = false;
    }
    return 0;
}
