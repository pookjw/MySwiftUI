#import "InterfaceGeneratorBase.h"
#import "XCSelect.h"
#import <UniformTypeIdentifiers/UniformTypeIdentifiers.h>
#import "UTType+Private.h"

@interface InterfaceGeneratorBase ()
@property (class, nonatomic, readonly, direct) NSString *baseLibraryIdentifier;
@property (class, nonatomic, readonly, direct) NSString *baseVariantIdentifier;
@property (class, nonatomic, readonly, direct) NSArray<NSString *> *baseTargets;
@end

@implementation InterfaceGeneratorBase

+ (NSString *)frameworkName {
    abort();
}

+ (NSString *)originalFrameworkName {
    abort();
}

+ (NSString *)baseLibraryIdentifier {
    return @"xros-arm64_x86_64-simulator";
}

+ (NSString *)baseVariantIdentifier {
    return @"arm64-apple-xros-simulator";
}

+ (NSArray<NSString *> *)baseTargets {
    return @[@"x86_64-xros-simulator", @"arm64-xros-simulator"];
}

+ (BOOL)_checkDirectoryExists:(NSURL *)url __attribute__((objc_direct)) {
    NSFileManager *fileManager = NSFileManager.defaultManager;
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:url.path isDirectory:&isDirectory];
    
    if (!isDirectory || !exists) {
        NSLog(@"Not found: %@", url);
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)_checkFileExists:(NSURL *)url __attribute__((objc_direct)) {
    NSFileManager *fileManager = NSFileManager.defaultManager;
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:url.path isDirectory:&isDirectory];
    
    if (isDirectory || !exists) {
        NSLog(@"Not found: %@", url);
        return NO;
    } else {
        return YES;
    }
}

+ (NSString * _Nullable)_swiftInterfaceFromURL:(NSURL *)interfaceURL __attribute__((objc_direct)) {
    // FIXME: 전체를 불러오지 않도록 수정
    NSData *data = [[NSData alloc] initWithContentsOfURL:interfaceURL];
    if (data == nil) {
        NSLog(@"Failed to load data: %@", interfaceURL);
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [data release];
    NSArray<NSString *> *splited = [string componentsSeparatedByString:@"\n"];
    [string release];
    
    if (splited.count < 4) {
        NSLog(@"Invalid swiftinterface: %@", interfaceURL);
        return nil;
    }
    
    return [[splited subarrayWithRange:NSMakeRange(0, 4)] componentsJoinedByString:@"\n"];
}

+ (NSString * _Nullable)_xcodeSwiftInterfaceHeaderWithVariant:(NSString *)variant platform:(NSString *)platform {
    NSURL *baseURL = [XCSelect.developerDirectoryURL URLByAppendingPathComponent:@"Platforms" isDirectory:YES];
    baseURL = [baseURL URLByAppendingPathComponent:platform conformingToType:UTTypePlatform];
    baseURL = [baseURL URLByAppendingPathComponent:@"Developer" isDirectory:YES];
    baseURL = [baseURL URLByAppendingPathComponent:@"SDKs" isDirectory:YES];
    baseURL = [baseURL URLByAppendingPathComponent:platform conformingToType:UTTypeSDK];
    baseURL = [baseURL URLByAppendingPathComponent:@"System" isDirectory:YES];
    baseURL = [baseURL URLByAppendingPathComponent:@"Library" isDirectory:YES];
    baseURL = [baseURL URLByAppendingPathComponent:@"Frameworks" isDirectory:YES];
    
    NSURL *sourceInterfaceURL = [baseURL URLByAppendingPathComponent:self.originalFrameworkName conformingToType:UTTypeFramework];
    sourceInterfaceURL = [sourceInterfaceURL URLByAppendingPathComponent:@"Modules" isDirectory:YES];
    sourceInterfaceURL = [sourceInterfaceURL URLByAppendingPathComponent:self.originalFrameworkName conformingToType:UTTypeSwiftModule];
    sourceInterfaceURL = [sourceInterfaceURL URLByAppendingPathComponent:variant conformingToType:UTTypeSwiftInterface];
    
    if (![InterfaceGeneratorBase _checkFileExists:sourceInterfaceURL]) {
        sourceInterfaceURL = [baseURL URLByAppendingPathComponent:@"SwiftUICore" conformingToType:UTTypeFramework];
        sourceInterfaceURL = [sourceInterfaceURL URLByAppendingPathComponent:@"Modules" isDirectory:YES];
        sourceInterfaceURL = [sourceInterfaceURL URLByAppendingPathComponent:@"SwiftUICore" conformingToType:UTTypeSwiftModule];
        sourceInterfaceURL = [sourceInterfaceURL URLByAppendingPathComponent:variant conformingToType:UTTypeSwiftInterface];
    }
    
    if (![InterfaceGeneratorBase _checkFileExists:sourceInterfaceURL]) {
        return nil;
    }
    
    return [InterfaceGeneratorBase _swiftInterfaceFromURL:sourceInterfaceURL];
}

+ (NSString * _Nullable)_interfaceDeclarationsFromURL:(NSURL *)interfaceURL __attribute__((objc_direct)) {
    if (![InterfaceGeneratorBase _checkFileExists:interfaceURL]) {
        return nil;
    }
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:interfaceURL];
    if (data == nil) {
        NSLog(@"Failed to load data: %@", interfaceURL);
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [data release];
    NSArray<NSString *> *splited = [string componentsSeparatedByString:@"\n"];
    [string release];
    
    if (splited.count < 4) {
        NSLog(@"Invalid swiftinterface: %@", interfaceURL);
        return nil;
    }
    
    return [[splited subarrayWithRange:NSMakeRange(4, splited.count - 4)] componentsJoinedByString:@"\n"];
}

+ (NSString * _Nullable)_updatedSwiftHeaderWithExisting:(NSString *)existing source:(NSString *)source __attribute__((objc_direct)) {
    if (([existing componentsSeparatedByString:@"\n"].count < 4) || ([source componentsSeparatedByString:@"\n"].count < 4)) {
        NSLog(@"Invalid swiftinterface.");
        return NO;
    }
    
    NSString *result = existing;
    
    {
        NSMutableArray<NSString *> *splitedExisting = [[result componentsSeparatedByString:@"\n"] mutableCopy];
        NSArray<NSString *> *splitedSource = [source componentsSeparatedByString:@"\n"];
        [splitedExisting replaceObjectsInRange:NSMakeRange(0, 2) withObjectsFromArray:[splitedSource subarrayWithRange:NSMakeRange(0, 2)]];
        result = [splitedExisting componentsJoinedByString:@"\n"];
        [splitedExisting release];
    }
    
    for (NSString *key in @[@"-target", @"-swift-version", @"-user-module-version"]) {
        NSMutableArray<NSString *> *splitedExisting = [[result componentsSeparatedByString:@" "] mutableCopy];
        NSArray<NSString *> *splitedSource = [source componentsSeparatedByString:@" "];
        
        NSInteger sourceIndex = [splitedSource indexOfObject:key];
        if ((sourceIndex == NSNotFound) || (splitedSource.count <= sourceIndex + 1)) {
            [splitedExisting release];
            NSLog(@"%@ not found", key);
            return nil;
        }
        
        NSInteger existingIndex = [splitedExisting indexOfObject:key];
        if ((existingIndex == NSNotFound) || (splitedExisting.count <= existingIndex + 1)) {
            [splitedExisting release];
            NSLog(@"%@ not found", key);
            return nil;
        }
        
        splitedExisting[existingIndex + 1] = splitedSource[sourceIndex + 1];
        result = [splitedExisting componentsJoinedByString:@" "];
        [splitedExisting release];
    }
    
    {
        NSMutableArray<NSString *> *splitedExisting = [[result componentsSeparatedByString:@"\n"] mutableCopy];
        NSArray<NSString *> *splitedSource = [source componentsSeparatedByString:@"\n"];
        splitedExisting[3] = splitedSource[3];
        result = [splitedExisting componentsJoinedByString:@"\n"];
        [splitedExisting release];
    }
    
    return result;
}

+ (BOOL)_writeIntefaceToURL:(NSURL *)interfaceURL swiftHeader:(NSString *)swiftHeader delcarations:(NSString *)delcarations __attribute__((objc_direct)) {
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSError * _Nullable error = nil;
    
    if ([fileManager fileExistsAtPath:interfaceURL.path]) {
        BOOL success = [fileManager removeItemAtURL:interfaceURL error:&error];
        if (!success) {
            NSLog(@"%@", error);
            return NO;
        }
    }
    
    NSString *result = [[NSString alloc] initWithFormat:@"%@\n%@", swiftHeader, delcarations];
    BOOL success = [result writeToURL:interfaceURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [result release];
    
    if (!success) {
        NSLog(@"%@", error);
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)_writeTBDFromURL:(NSURL *)fromURL toURL:(NSURL *)toURL newTargets:(NSArray<NSString *> *)newTargets {
    if ([toURL isEqual:fromURL]) {
        return YES;
    }
    
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSError * _Nullable error = nil;
    
    if ([fileManager fileExistsAtPath:toURL.path]) {
        BOOL success = [fileManager removeItemAtURL:toURL error:&error];
        if (!success) {
            NSLog(@"%@", error);
            return NO;
        }
    }
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:fromURL options:0 error:&error];
    if (data == nil) {
        NSLog(@"%@", error);
        return NO;
    }
    
    NSMutableString *string = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [data release];
    [string replaceOccurrencesOfString:[self.baseTargets componentsJoinedByString:@", "] withString:[newTargets componentsJoinedByString:@", "] options:0 range:NSMakeRange(0, string.length)];
    BOOL success = [string writeToURL:toURL atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    if (!success) {
        NSLog(@"%@", error);
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)_copyHeadersToURL:(NSURL *)toURL fromURL:(NSURL *)fromURL __attribute__((objc_direct)) {
    if ([toURL isEqual:fromURL]) {
        return YES;
    }
    
    NSFileManager *fileManager = NSFileManager.defaultManager;
    NSError * _Nullable error = nil;
    BOOL isDirectory;
    BOOL exists = [fileManager fileExistsAtPath:fromURL.path isDirectory:&isDirectory];
    
    if (!exists) {
        exists = [fileManager fileExistsAtPath:toURL.path];
        if (exists) {
            BOOL success = [fileManager removeItemAtURL:toURL error:&error];
            if (!success) {
                NSLog(@"%@", error);
                return NO;
            }
        }
        
        return YES;
    }
    
    if (!isDirectory) {
        NSLog(@"%@ is not a directory.", fromURL);
        return NO;
    }
    
    exists = [fileManager fileExistsAtPath:toURL.path];
    if (exists) {
        BOOL success = [fileManager removeItemAtURL:toURL error:&error];
        if (!success) {
            NSLog(@"%@", error);
            return NO;
        }
    }
    
    BOOL success = [fileManager copyItemAtURL:fromURL toURL:toURL error:&error];
    if (!success) {
        NSLog(@"%@", error);
        return NO;
    }
    
    return YES;
}

+ (BOOL)generateToURL:(NSURL *)url {
    NSDictionary<NSString *, NSArray<NSString *> *> *libraryToVariants = @{
        @"xros-arm64_arm64e": @[
            @"arm64e-apple-xros"
        ],
        @"xros-arm64_x86_64-simulator": @[
            @"arm64-apple-xros-simulator",
            @"x86_64-apple-xros-simulator"
        ]
    };
    NSDictionary<NSString *, NSString *> *libraryToPlatform = @{
        @"xros-arm64_arm64e": @"XROS",
        @"xros-arm64_x86_64-simulator": @"XRSimulator"
    };
    NSDictionary<NSString *, NSArray<NSString *> *> *libraryToTargets = @{
        @"xros-arm64_arm64e": @[@"arm64-xros", @"arm64e-xros"],
        @"xros-arm64_x86_64-simulator": @[@"x86_64-xros-simulator", @"arm64-xros-simulator"]
    };
    
    NSURL *frameworkURL = url;
    frameworkURL = [frameworkURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeXCFramework];
    if (![InterfaceGeneratorBase _checkDirectoryExists:frameworkURL]) {
        return NO;
    }
    
    NSURL *baseFrameworkURL = [frameworkURL URLByAppendingPathComponent:self.baseLibraryIdentifier isDirectory:YES];
    baseFrameworkURL = [baseFrameworkURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeFramework];
    if (![InterfaceGeneratorBase _checkDirectoryExists:baseFrameworkURL]) {
        return NO;
    }
    
    // 없을 수도 있음
    NSURL *baseHeadersURL = [baseFrameworkURL URLByAppendingPathComponent:@"Headers" isDirectory:YES];
    
    NSURL *baseSwiftInterfaceURL = [baseFrameworkURL URLByAppendingPathComponent:@"Modules" isDirectory:YES];
    baseSwiftInterfaceURL = [baseSwiftInterfaceURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeSwiftModule];
    baseSwiftInterfaceURL = [baseSwiftInterfaceURL URLByAppendingPathComponent:self.baseVariantIdentifier conformingToType:UTTypeSwiftInterface];
    NSString * _Nullable oldSwiftHeader = [InterfaceGeneratorBase _swiftInterfaceFromURL:baseSwiftInterfaceURL];
    NSString * _Nullable declarations = [InterfaceGeneratorBase _interfaceDeclarationsFromURL:baseSwiftInterfaceURL];
    
    NSURL *basePrivateSwiftInterfaceURL = [baseFrameworkURL URLByAppendingPathComponent:@"Modules" isDirectory:YES];
    basePrivateSwiftInterfaceURL = [basePrivateSwiftInterfaceURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeSwiftModule];
    basePrivateSwiftInterfaceURL = [basePrivateSwiftInterfaceURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.private", self.baseVariantIdentifier] conformingToType:UTTypeSwiftInterface];
    NSString * _Nullable oldPrivateSwiftHeader = [InterfaceGeneratorBase _swiftInterfaceFromURL:basePrivateSwiftInterfaceURL];
    NSString * _Nullable privateDeclarations = [InterfaceGeneratorBase _interfaceDeclarationsFromURL:basePrivateSwiftInterfaceURL];
    
    NSURL *baseTBDURL = [baseFrameworkURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeTBD];
    if (![InterfaceGeneratorBase _checkFileExists:baseTBDURL]) {
        return NO;
    }
    
    for (NSString *libraryName in libraryToVariants.allKeys) {
        NSURL *targetFrameworkURL = frameworkURL;
        targetFrameworkURL = [targetFrameworkURL URLByAppendingPathComponent:libraryName isDirectory:YES];
        targetFrameworkURL = [targetFrameworkURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeFramework];
        
        if (![InterfaceGeneratorBase _checkDirectoryExists:targetFrameworkURL]) {
            return NO;
        }
        
        // 없을 수도 있음
        NSURL *targetHeadersURL = [targetFrameworkURL URLByAppendingPathComponent:@"Headers" isDirectory:YES];
        
        NSArray<NSString *> *variantNames = libraryToVariants[libraryName];
        NSString *platform = libraryToPlatform[libraryName];
        
        for (NSString *variant in variantNames) {
            if (oldSwiftHeader != nil) {
                assert(declarations != nil);
                
                NSURL *targetSwiftInterfaceURL = targetFrameworkURL;
                targetSwiftInterfaceURL = [targetSwiftInterfaceURL URLByAppendingPathComponent:@"Modules" isDirectory:YES];
                targetSwiftInterfaceURL = [targetSwiftInterfaceURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeSwiftModule];
                targetSwiftInterfaceURL = [targetSwiftInterfaceURL URLByAppendingPathComponent:variant conformingToType:UTTypeSwiftInterface];
                
                NSString *xcodeSwiftHeader = [self _xcodeSwiftInterfaceHeaderWithVariant:variant platform:platform];
                NSString *updatedSwiftHeader = [InterfaceGeneratorBase _updatedSwiftHeaderWithExisting:oldSwiftHeader source:xcodeSwiftHeader];
                if (updatedSwiftHeader == nil) {
                    return NO;
                }
                BOOL result = [InterfaceGeneratorBase _writeIntefaceToURL:targetSwiftInterfaceURL swiftHeader:updatedSwiftHeader delcarations:declarations];
                
                if (!result) {
                    return NO;
                }
            }
            
            //
            
            if (oldPrivateSwiftHeader != nil) {
                assert(privateDeclarations != nil);
                NSURL *targetPrivateSwiftInterfaceURL = targetFrameworkURL;
                targetPrivateSwiftInterfaceURL = [targetPrivateSwiftInterfaceURL URLByAppendingPathComponent:@"Modules" isDirectory:YES];
                targetPrivateSwiftInterfaceURL = [targetPrivateSwiftInterfaceURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeSwiftModule];
                targetPrivateSwiftInterfaceURL = [targetPrivateSwiftInterfaceURL URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.private", variant] conformingToType:UTTypeSwiftInterface];
                
                NSString *xcodeSwiftHeader = [self _xcodeSwiftInterfaceHeaderWithVariant:variant platform:platform];
                NSString *updatedSwiftHeader = [InterfaceGeneratorBase _updatedSwiftHeaderWithExisting:oldPrivateSwiftHeader source:xcodeSwiftHeader];
                if (updatedSwiftHeader == nil) {
                    return NO;
                }
                BOOL result = [InterfaceGeneratorBase _writeIntefaceToURL:targetPrivateSwiftInterfaceURL swiftHeader:updatedSwiftHeader delcarations:privateDeclarations];
                
                if (!result) {
                    return NO;
                }
            }
        }
        
        BOOL result = [InterfaceGeneratorBase _copyHeadersToURL:targetHeadersURL fromURL:baseHeadersURL];
        if (!result) {
            return NO;
        }
        
        NSURL *targetTBDURL = [targetFrameworkURL URLByAppendingPathComponent:self.frameworkName conformingToType:UTTypeTBD];
        if (![InterfaceGeneratorBase _checkFileExists:targetTBDURL]) {
            return NO;
        }
        result = [InterfaceGeneratorBase _writeTBDFromURL:baseTBDURL toURL:targetTBDURL newTargets:libraryToTargets[libraryName]];
        if (!result) {
            return NO;
        }
    }
    
    return YES;
}

@end
