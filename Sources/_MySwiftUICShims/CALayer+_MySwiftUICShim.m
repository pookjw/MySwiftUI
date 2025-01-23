#import "CALayer+_MySwiftUICShim.h"

// Original : _swiftUI_displayListID
#define MY_SWIFT_UI_DISPLAT_LIST_ID @"_mySwiftUI_displayListID"

@implementation CALayer (_MySwiftUICShim)

- (NSInteger)mySwiftUI_displayListID {
    return [[self valueForKey:MY_SWIFT_UI_DISPLAT_LIST_ID] integerValue];
}

- (void)setMySwiftUI_displayListID:(NSInteger)mySwiftUI_displayListID {
    [self setValue:@(mySwiftUI_displayListID) forKey:MY_SWIFT_UI_DISPLAT_LIST_ID];
}

@end
