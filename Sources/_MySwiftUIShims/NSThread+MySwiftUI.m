#import "include/NSThread+MySwiftUI.h"
@import _FoundationPrivate;

BOOL _NSThreadStart(NSThread *thread) {
    if ([thread respondsToSelector:@selector(startAndReturnError:)]) {
        return [thread startAndReturnError:NULL];
    } else {
        [thread start];
        return YES;
    }
}
