#import "Localization.h"
#include <os/lock.h>
@import _FoundationPrivate;

NSString * _Nullable _getBestLocalization(NSBundle *bundle, NSLocale * _Nullable locale) {
    /*
     bundle -> x0 -> x19
     locale -> x1 -> x20
     */
    if (locale == nil) {
        return nil;
    }
    
    if ([locale isEqual:NSLocale.currentLocale]) {
        return nil;
    }
    
    // x22
    if (locale.languageIdentifier == nil) {
        return nil;
    }
    
    static os_unfair_lock lock = OS_UNFAIR_LOCK_INIT;
    os_unfair_lock_lock(&lock);
    
    static NSMapTable<NSBundle *, NSMutableDictionary<NSString *, NSString *> *> * _Nullable cache = nil;
    if (cache == nil) {
        cache = [NSMapTable weakToStrongObjectsMapTable];
    }
    
    // <+208>
    NSMutableDictionary<NSString *, NSString *> * _Nullable dictionary = [cache objectForKey:bundle];
    NSString * _Nullable cached = [dictionary objectForKey:locale.localeIdentifier];
    
    os_unfair_lock_unlock(&lock);
    
    if (cached != nil) {
        return cached;
    }
    
    // <+376>
    NSArray<NSString *> *preferredLocalizations = [NSBundle preferredLocalizationsFromArray:bundle.localizations forPreferences:@[locale.languageIdentifier]];
    // x24
    NSString * _Nullable preferredLocalization = preferredLocalizations.firstObject;
    
    os_unfair_lock_lock(&lock);
    
    if (dictionary == nil) {
        dictionary = [NSMutableDictionary new];
        [cache setObject:dictionary forKey:bundle];
    }
    
    dictionary[locale.localeIdentifier] = preferredLocalization;
    
    os_unfair_lock_unlock(&lock);
    
    return preferredLocalization;
}

NSString * _LocalizeString(NSBundle *bundle, NSString *key, NSString * _Nullable table, NSLocale * _Nullable locale) {
    /*
     bundle -> x0 -> x19
     key -> x1 -> x20
     table -> x2 -> x21
     locale -> x3 -> x22
     */
    // x22
    NSString * _Nullable localization = _getBestLocalization(bundle, locale);
    
    if (localization != nil) {
        // <+76>
        return [bundle localizedStringForKey:key value:nil table:table localization:localization];
    } else {
        // <+112>
        return [bundle localizedStringForKey:key value:nil table:table];
    }
}

NSAttributedString * _LocalizeAttributedString(NSBundle *bundle, NSString *key, NSString * _Nullable table, NSLocale * _Nullable locale) {
    NSString * _Nullable localization = _getBestLocalization(bundle, locale);
    
    if (localization != nil) {
        return [bundle localizedAttributedStringForKey:key value:nil table:table localization:localization];
    } else {
        return [bundle localizedAttributedStringForKey:key value:nil table:table];
    }
}
