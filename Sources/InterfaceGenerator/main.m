#import <Foundation/Foundation.h>
#import "Subclasses/AccessibilityInterfaceGenerator.h"
#import "Subclasses/AttributeGraphInterfaceGenerator.h"
#import "Subclasses/BaseBoardInterfaceGenerator.h"
#import "Subclasses/BoardServicesInterfaceGenerator.h"
#import "Subclasses/CoreFoundationInterfaceGenerator.h"
#import "Subclasses/CoreREInterfaceGenerator.h"
#import "Subclasses/CoreServicesInterfaceGenerator.h"
#import "Subclasses/CoreUIInterfaceGenerator.h"
#import "Subclasses/DesignLibraryInterfaceGenerator.h"
#import "Subclasses/ElegibilityInterfaceGenerator.h"
#import "Subclasses/FeatureFlagsInterfaceGenerator.h"
#import "Subclasses/FoundationInterfaceGenerator.h"
#import "Subclasses/FrontBoardServicesInterfaceGenerator.h"
#import "Subclasses/MRUIKitInterfaceGenerator.h"
#import "Subclasses/ObservationInterfaceGenerator.h"
#import "Subclasses/QuartzCoreInterfaceGenerator.h"
#import "Subclasses/RealityFoundationInterfaceGenerator.h"
#import "Subclasses/RealityFusionInterfaceGenerator.h"
#import "Subclasses/RealitySystemSupportInterfaceGenerator.h"
#import "Subclasses/RealitySimulationServicesInterfaceGenerator.h"
#import "Subclasses/RenderBoxInterfaceGenerator.h"
#import "Subclasses/SoftLinkingInterfaceGenerator.h"
#import "Subclasses/StopwatchSupportInterfaceGenerator.h"
#import "Subclasses/SwiftInterfaceGenerator.h"
#import "Subclasses/SwiftUICoreInterfaceGenerator.h"
#import "Subclasses/SwiftUIInterfaceGenerator.h"
#import "Subclasses/TCCInterfaceGenerator.h"
#import "Subclasses/UIAccessibilityInterfaceGenerator.h"
#import "Subclasses/UIFoundationInterfaceGenerator.h"
#import "Subclasses/UIIntelligenceSupportInterfaceGenerator.h"
#import "Subclasses/UIKitInterfaceGenerator.h"
#import "Subclasses/UIKitServicesInterfaceGenerator.h"
#import "Subclasses/UserActivityInterfaceGenerator.h"
#import "XCSelect.h"

NSURL * _Nullable resolveURL(const char *path) {
    NSString *string = [[NSString alloc] initWithCString:path encoding:NSUTF8StringEncoding];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:string isDirectory:YES];
    
    NSFileManager *fileManager = NSFileManager.defaultManager;
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:string isDirectory:&isDirectory];
    [string release];
    
    if (isDirectory && exists) {
        return [url autorelease];
    } else {
        [url release];
        return nil;
    }
}

BOOL updateSwiftSyntaxVersion(NSURL *resolvedURL) {
    NSURL *configURL = [XCSelect.developerDirectoryURL URLByAppendingPathComponent:@"Toolchains/XcodeDefault.xctoolchain/usr/share/pm/config.json" isDirectory:NO];
    BOOL isDirectory = NO;
    BOOL exists = [NSFileManager.defaultManager fileExistsAtPath:configURL.path isDirectory:&isDirectory];
    
    if (isDirectory || !exists) {
        NSLog(@"Not found: %@", configURL);
        return NO;
    }
    
    NSData *configJSONData = [[NSData alloc] initWithContentsOfURL:configURL];
    NSError * _Nullable error = nil;
    NSDictionary<NSString *, id> *configJSON = [NSJSONSerialization JSONObjectWithData:configJSONData options:0 error:&error];
    if (configJSON == nil) {
        NSLog(@"%@", error);
        return NO;
    }
    NSDictionary<NSString *, id> *swiftSyntaxVersionForMacroTemplate = configJSON[@"swiftSyntaxVersionForMacroTemplate"];
    if (swiftSyntaxVersionForMacroTemplate == nil) {
        NSLog(@"JSON Error");
        return NO;
    }
    NSNumber *major = swiftSyntaxVersionForMacroTemplate[@"major"];
    NSNumber *minor = swiftSyntaxVersionForMacroTemplate[@"minor"];
    NSNumber *patch = swiftSyntaxVersionForMacroTemplate[@"patch"];
    NSString *prereleaseIdentifier = swiftSyntaxVersionForMacroTemplate[@"prereleaseIdentifier"];
    if ((major == nil) || (minor == nil) || (patch == nil) || (prereleaseIdentifier == nil)) {
        NSLog(@"JSON Error");
        return NO;
    }
    
    NSURL *packageURL = [resolvedURL URLByAppendingPathComponent:@"Package.swift" isDirectory:NO];
    exists = [NSFileManager.defaultManager fileExistsAtPath:packageURL.path isDirectory:&isDirectory];
    
    if (isDirectory || !exists) {
        NSLog(@"Not found: %@", packageURL);
        return NO;
    }
    
    NSData *packageData = [[NSData alloc] initWithContentsOfURL:packageURL];
    NSString *packageString = [[NSString alloc] initWithData:packageData encoding:NSUTF8StringEncoding];
    [packageData release];
    NSMutableArray<NSString *> *packageStrings = [[packageString componentsSeparatedByString:@"\n"] mutableCopy];
    [packageString release];
    
    __block BOOL found = NO;
    [packageStrings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj containsString:@"https://github.com/swiftlang/swift-syntax.git"]) {
            packageStrings[idx] = [NSString stringWithFormat:@"        .package(url: \"https://github.com/swiftlang/swift-syntax.git\", from: \"%@.%@.%@-%@\")", major, minor, patch, prereleaseIdentifier];
            *stop = YES;
            found = YES;
        }
    }];
    
    if (!found) {
        return NO;
    }
    
    BOOL result = [NSFileManager.defaultManager removeItemAtURL:packageURL error:&error];
    if (!result) {
        NSLog(@"%@", error);
        return NO;
    }
    
    packageString = [packageStrings componentsJoinedByString:@"\n"];
    [packageStrings release];
    
    packageData = [packageString dataUsingEncoding:NSUTF8StringEncoding];
    result = [packageData writeToURL:packageURL options:0 error:&error];
    if (!result) {
        NSLog(@"%@", error);
        return NO;
    }
    
    return YES;
}

int main(int argc, const char * argv[]) {
    if (argc < 3) {
        NSLog(@"InterfaceGenerator -p $PATH");
        return EXIT_FAILURE;
    }
    
    const char *path = argv[2];
    NSURL *resolvedURL = resolveURL(path);
    if (resolvedURL == nil) {
        NSLog(@"Does not exist: %s", path);
        return EXIT_FAILURE;
    }
    
    assert(updateSwiftSyntaxVersion(resolvedURL));
    
    assert([AccessibilityInterfaceGenerator generateToURL:resolvedURL]);
    assert([AttributeGraphInterfaceGenerator generateToURL:resolvedURL]);
    assert([BaseBoardInterfaceGenerator generateToURL:resolvedURL]);
    assert([BoardServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([CoreFoundationInterfaceGenerator generateToURL:resolvedURL]);
    assert([CoreREInterfaceGenerator generateToURL:resolvedURL]);
    assert([CoreServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([CoreUIInterfaceGenerator generateToURL:resolvedURL]);
    assert([DesignLibraryInterfaceGenerator generateToURL:resolvedURL]);
    assert([ElegibilityInterfaceGenerator generateToURL:resolvedURL]);
    assert([FeatureFlagsInterfaceGenerator generateToURL:resolvedURL]);
    assert([FoundationInterfaceGenerator generateToURL:resolvedURL]);
    assert([FrontBoardServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([MRUIKitInterfaceGenerator generateToURL:resolvedURL]);
    assert([ObservationInterfaceGenerator generateToURL:resolvedURL]);
    assert([QuartzCoreInterfaceGenerator generateToURL:resolvedURL]);
    assert([RealityFoundationInterfaceGenerator generateToURL:resolvedURL]);
    assert([RealityFusionInterfaceGenerator generateToURL:resolvedURL]);
    assert([RealitySystemSupportInterfaceGenerator generateToURL:resolvedURL]);
    assert([RealitySimulationServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([RenderBoxInterfaceGenerator generateToURL:resolvedURL]);
    assert([SoftLinkingInterfaceGenerator generateToURL:resolvedURL]);
    assert([StopwatchSupportInterfaceGenerator generateToURL:resolvedURL]);
    assert([SwiftInterfaceGenerator generateToURL:resolvedURL]);
    assert([SwiftUICoreInterfaceGenerator generateToURL:resolvedURL]);
    assert([SwiftUIInterfaceGenerator generateToURL:resolvedURL]);
    assert([TCCInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIAccessibilityInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIFoundationInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIIntelligenceSupportInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIKitInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIKitServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([UserActivityInterfaceGenerator generateToURL:resolvedURL]);
    
    return EXIT_SUCCESS;
}
