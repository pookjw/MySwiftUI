#import "include/NSThread+MySwiftUI.h"

@interface NSThread (MySwiftUI)
- (BOOL)startAndReturnError:(NSError * _Nullable __autoreleasing * _Nullable)error;
@end

BOOL _NSThreadStart(NSThread *thread) {
    if ([thread respondsToSelector:@selector(startAndReturnError:)]) {
        return [thread startAndReturnError:NULL];
    } else {
        [thread start];
        return YES;
    }
}
