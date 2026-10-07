#import "DarwinInterfaceGenerator.h"

@implementation DarwinInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_DarwinPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"Darwin";
}

+ (BOOL)generatesSwiftInterfaces {
    return NO;
}

@end
