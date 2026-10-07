#import "DyldInterfaceGenerator.h"

@implementation DyldInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_DyldPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"Dyld";
}

+ (BOOL)generatesSwiftInterfaces {
    return NO;
}

@end
