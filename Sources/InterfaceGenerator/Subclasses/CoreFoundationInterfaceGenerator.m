//
//  CoreFoundationInterfaceGenerator.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 4/2/26.
//

#import "CoreFoundationInterfaceGenerator.h"

@implementation CoreFoundationInterfaceGenerator

+ (NSString *)frameworkName {
    return @"_CoreFoundationPrivate";
}

+ (NSString *)originalFrameworkName {
    return @"CoreFoundation";
}

@end
