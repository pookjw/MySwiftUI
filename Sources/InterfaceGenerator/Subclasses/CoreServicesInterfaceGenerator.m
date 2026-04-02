#import "CoreServicesInterfaceGenerator.h"

@implementation CoreServicesInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_CoreServicesPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"CoreServices";
}

@end
