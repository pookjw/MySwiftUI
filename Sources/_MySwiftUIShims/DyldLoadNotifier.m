#import "private/DyldLoadNotifier.h"

extern void uiKitShims_onDyldLoaded(void);
extern void stopwatchSupportShims_onDyldLoaded(void);

@implementation MySwiftUI_DyldLoadNotifier

+ (void)load {
    uiKitShims_onDyldLoaded();
    stopwatchSupportShims_onDyldLoaded();
}

@end
