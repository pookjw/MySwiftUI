//
//  QuartzCoreInterfaceGenerator.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 4/2/26.
//

#import "QuartzCoreInterfaceGenerator.h"

@implementation QuartzCoreInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_QuartzCorePrivate";
}

+ (NSString *)originalFrameworkName {
    return @"QuartzCore";
}

@end
