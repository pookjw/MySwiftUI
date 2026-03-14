//
//  MSUIDyldLoadNotifier.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 3/14/26.
//

#import "private/MSUIDyldLoadNotifier.h"

extern void uiKitShims_onDyldLoaded(void);
extern void stopwatchSupportShims_onDyldLoaded(void);

@implementation MSUIDyldLoadNotifier

+ (void)load {
    uiKitShims_onDyldLoaded();
    stopwatchSupportShims_onDyldLoaded();
}

@end
