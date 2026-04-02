#import "XCSelect.h"
#include <dlfcn.h>

@interface XCSelect ()
@property (class, nonatomic, readonly, direct) void *image;
@end

@implementation XCSelect
static void * _Nullable _image;

+ (void *)image {
    return _image;
}

+ (void)load {
    void *image = dlopen("/usr/lib/libxcselect.dylib", RTLD_NOW);
    assert(image != NULL);
    _image = image;
}

+ (NSURL *)developerDirectoryURL {
    void *symbol = dlsym(XCSelect.image, "xcselect_get_developer_dir_path");
    assert(symbol != NULL);
    char path[1024];
    bool flag1;
    bool flag2;
    bool flag3;
    bool result = ((bool * (*)(char *, size_t, bool *, bool *, bool *))symbol)(path, sizeof(path), &flag1, &flag2, &flag3);
    assert(result);
    NSString *string = [[NSString alloc] initWithCString:path encoding:NSUTF8StringEncoding];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:string];
    [string release];
    return [url autorelease];
}

@end
