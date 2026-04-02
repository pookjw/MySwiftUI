#import "UTType+Private.h"
#include <objc/runtime.h>

typedef struct __attribute__((aligned(16))) {
    Class isa;
    void *pad;
    NSString *identifier;
} Tag;

Tag xcFrameworkTag = {
    objc_lookUpClass("_UTCoreType"),
    NULL,
    @"dyn.ah62d4rv4ge81u25gsmu043p1r73g0"
};
UTType * const UTTypeXCFramework = (UTType *)&xcFrameworkTag;

Tag swiftInterfaceTag = {
    objc_lookUpClass("_UTCoreType"),
    NULL,
    @"public.swift-interface"
};
UTType * const UTTypeSwiftInterface = (UTType *)&swiftInterfaceTag;

Tag swiftModuleTag = {
    objc_lookUpClass("_UTCoreType"),
    NULL,
    @"dyn.ah62d4rv4ge81g75mq34g455esz0gn"
};
UTType * const UTTypeSwiftModule = (UTType *)&swiftModuleTag;

Tag platformTag = {
    objc_lookUpClass("_UTCoreType"),
    NULL,
    @"dyn.ah62d4rv4ge81a5dbsvxg86xr"
};
UTType * const UTTypePlatform = (UTType *)&platformTag;

Tag sdkTag = {
    objc_lookUpClass("_UTCoreType"),
    NULL,
    @"dyn.ah62d4rv4ge81g3dp"
};
UTType * const UTTypeSDK = (UTType *)&sdkTag;

Tag tbdTag = {
    objc_lookUpClass("_UTCoreType"),
    NULL,
    @"com.apple.text-based-dylib"
};
UTType * const UTTypeTBD = (UTType *)&tbdTag;
