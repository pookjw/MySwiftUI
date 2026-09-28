#ifndef Localization_h
#define Localization_h

#import <Foundation/Foundation.h>
#import "Defines.h"

NS_ASSUME_NONNULL_BEGIN

MSUI_EXTERN NSString * _LocalizeString(NSBundle *bundle, NSString *key, NSString * _Nullable table, NSLocale * _Nullable locale);
MSUI_EXTERN NSAttributedString * _LocalizeAttributedString(NSBundle *bundle, NSString *key, NSString * _Nullable table, NSLocale * _Nullable locale);

NS_ASSUME_NONNULL_END

#endif
