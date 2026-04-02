#import <Foundation/Foundation.h>
#import "Subclasses/AccessibilityInterfaceGenerator.h"
#import "Subclasses/AttributeGraphInterfaceGenerator.h"
#import "Subclasses/BaseBoardInterfaceGenerator.h"
#import "Subclasses/CoreFoundationInterfaceGenerator.h"
#import "Subclasses/CoreREInterfaceGenerator.h"
#import "Subclasses/DesignLibraryInterfaceGenerator.h"
#import "Subclasses/ElegibilityInterfaceGenerator.h"
#import "Subclasses/FeatureFlagsInterfaceGenerator.h"
#import "Subclasses/FrontBoardServicesInterfaceGenerator.h"
#import "Subclasses/MRUIKitInterfaceGenerator.h"
#import "Subclasses/ObservationInterfaceGenerator.h"
#import "Subclasses/QuartzCoreInterfaceGenerator.h"
#import "Subclasses/RealitySimulationServicesInterfaceGenerator.h"
#import "Subclasses/RenderBoxInterfaceGenerator.h"
#import "Subclasses/StopwatchSupportInterfaceGenerator.h"
#import "Subclasses/SwiftInterfaceGenerator.h"
#import "Subclasses/SwiftUICoreInterfaceGenerator.h"
#import "Subclasses/SwiftUIInterfaceGenerator.h"
#import "Subclasses/TCCInterfaceGenerator.h"
#import "Subclasses/UIAccessibilityInterfaceGenerator.h"
#import "Subclasses/UIIntelligenceSupportInterfaceGenerator.h"
#import "Subclasses/UIKitInterfaceGenerator.h"

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
    
    assert([AccessibilityInterfaceGenerator generateToURL:resolvedURL]);
    assert([AttributeGraphInterfaceGenerator generateToURL:resolvedURL]);
    assert([BaseBoardInterfaceGenerator generateToURL:resolvedURL]);
    assert([CoreFoundationInterfaceGenerator generateToURL:resolvedURL]);
    assert([CoreREInterfaceGenerator generateToURL:resolvedURL]);
    assert([DesignLibraryInterfaceGenerator generateToURL:resolvedURL]);
    assert([ElegibilityInterfaceGenerator generateToURL:resolvedURL]);
    assert([FeatureFlagsInterfaceGenerator generateToURL:resolvedURL]);
    assert([FrontBoardServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([MRUIKitInterfaceGenerator generateToURL:resolvedURL]);
    assert([ObservationInterfaceGenerator generateToURL:resolvedURL]);
    assert([QuartzCoreInterfaceGenerator generateToURL:resolvedURL]);
    assert([RealitySimulationServicesInterfaceGenerator generateToURL:resolvedURL]);
    assert([RenderBoxInterfaceGenerator generateToURL:resolvedURL]);
    assert([StopwatchSupportInterfaceGenerator generateToURL:resolvedURL]);
    assert([SwiftInterfaceGenerator generateToURL:resolvedURL]);
    assert([SwiftUICoreInterfaceGenerator generateToURL:resolvedURL]);
    assert([SwiftUIInterfaceGenerator generateToURL:resolvedURL]);
    assert([TCCInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIAccessibilityInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIIntelligenceSupportInterfaceGenerator generateToURL:resolvedURL]);
    assert([UIKitInterfaceGenerator generateToURL:resolvedURL]);
    
    return EXIT_SUCCESS;
}
