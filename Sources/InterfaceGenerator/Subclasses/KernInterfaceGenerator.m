#import "KernInterfaceGenerator.h"

@implementation KernInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_KernPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"Kern";
}

+ (BOOL)generatesSwiftInterfaces {
    return NO;
}

@end
