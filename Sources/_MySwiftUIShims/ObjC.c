#include "include/ObjcC.h"
#include <objc/message.h>

OBJC_EXPORT id objc_msgSendSuper2(void); /* objc_super superInfo = { self, [self class] }; */

const void * _Nonnull msui_objc_msgSend(void) {
    return objc_msgSend;
}


const void * _Nonnull msui_objc_msgSendSuper2(void) {
    return objc_msgSendSuper2;
}
