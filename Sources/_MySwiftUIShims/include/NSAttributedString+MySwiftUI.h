//
//  NSAttributedString+MySwiftUI.swift
//  MySwiftUI
//
//  Created by Jinwoo Kim on 3/13/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (MySwiftUI)
- (instancetype)initSwiftUIAttributedStringWithFormat:(NSAttributedString *)format options:(NSAttributedStringFormattingOptions)options locale:(nullable NSLocale *)locale arguments:(va_list)arguments;
@end

NS_ASSUME_NONNULL_END
