//
//  NSAttributedString+MySwiftUI.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 3/13/26.
//

#import "include/NSAttributedString+MySwiftUI.h"

@implementation NSAttributedString (MySwiftUI)

- (instancetype)initSwiftUIAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(nullable NSLocale *)locale arguments:(va_list)arguments {
    return [self initWithFormat:format options:options locale:locale arguments:arguments];
}

@end
