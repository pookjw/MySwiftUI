#import "include/NSThread+MySwiftUI.h"

@interface NSThread (MySwiftUI)
- (BOOL)startAndReturnError:(NSError **)error;
@end

BOOL _NSThreadStart(NSThread *thread) {
    if ([thread respondsToSelector:@selector(startAndReturnError:)]) {
        return [thread startAndReturnError:nil];
    } else {
        [thread start];
        return YES;
    }
}
