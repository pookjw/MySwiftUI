#import "private/MSUIDyldLoadNotifier.h"

extern void uiKitShims_onDyldLoaded(void);
extern void stopwatchSupportShims_onDyldLoaded(void);

@implementation MSUIDyldLoadNotifier

+ (void)load {
    uiKitShims_onDyldLoaded();
    stopwatchSupportShims_onDyldLoaded();
}

@end
