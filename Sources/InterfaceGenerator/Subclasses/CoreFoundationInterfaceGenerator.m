#import "CoreFoundationInterfaceGenerator.h"

@implementation CoreFoundationInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_CoreFoundationPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"CoreFoundation";
}

@end
