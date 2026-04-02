#import "FoundationInterfaceGenerator.h"

@implementation FoundationInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_FoundationPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"Foundation";
}

@end
