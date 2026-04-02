#import "QuartzCoreInterfaceGenerator.h"

@implementation QuartzCoreInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_QuartzCorePrivate";
}

+ (NSString *)originalFrameworkName {
    return @"QuartzCore";
}

@end
