#include "include/AppleInternal.h"
#include <_abort.h>

bool _MySwiftUIIsAppleInternalBuild(void) {
    abort();
}
