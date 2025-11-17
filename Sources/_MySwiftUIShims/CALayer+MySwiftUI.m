//
//  CALayer+MySwiftUI.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 11/17/25.
//

#import "include/CALayer+MySwiftUI.h"

@implementation CALayer (MySwiftUI)

- (void)setMySwiftUI_displayListID:(NSInteger)displayListID {
    [self setValue:@(displayListID) forKey:@"_swiftUI_displayListID"];
}

- (NSInteger)mySwiftUI_displayListID {
    NSNumber * _Nullable value = [self valueForKey:@"_swiftUI_displayListID"];
    if (value == nil) {
        return NSIntegerMax;
    } else {
        return value.integerValue;
    }
}

@end
