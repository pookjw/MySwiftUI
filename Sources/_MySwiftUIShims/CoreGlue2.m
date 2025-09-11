#import "CoreGlue2.h"
#include <objc/runtime.h>
#include "private/Utils.h"

extern void abort_report_np(const char *, ...);

Class __getMySwiftUIGlue2ClassSymbolLoc() {
    // original : _sl_dlopen(const char **, os_log_t)
    return objc_lookUpClass("MySwiftUIGlue2");
}

id _initializeMyCoreGlue2(void) {
    return [[[__getMySwiftUIGlue2ClassSymbolLoc() alloc] init] autorelease];
}
