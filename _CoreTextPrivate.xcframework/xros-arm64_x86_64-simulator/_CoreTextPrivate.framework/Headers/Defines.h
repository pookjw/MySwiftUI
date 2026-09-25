#import <CoreText/CoreText.h>

CF_IMPLICIT_BRIDGING_ENABLED
CF_EXTERN_C_BEGIN
CF_ASSUME_NONNULL_BEGIN

CT_EXPORT const CFStringRef kCTFontUIFontDesignTrait;
CT_EXPORT const CFStringRef kCTFontUIFontDesignMonospaced;
CT_EXPORT const CFStringRef kCTFontUIFontDesignDefault;
CT_EXPORT const CFStringRef kCTFontUIFontDesignRounded;
CT_EXPORT const CFStringRef kCTFontUIFontDesignSerif;
CT_EXPORT const CFStringRef kCTFontLegibilityWeightAttribute;
CT_EXPORT const CFStringRef kCTFontTargetEnvironmentAttribute;

typedef CF_ENUM(NSInteger, CTFontLegibilityWeight) {
    CTFontLegibilityWeightRegular = 0,
    CTFontLegibilityWeightBold = 1
};

typedef CF_ENUM(uint32_t, CTFontTargetEnvironment) {
    CTFontTargetEnvironmentUnknown3 = 3
};

CF_ASSUME_NONNULL_END
CF_EXTERN_C_END
CF_IMPLICIT_BRIDGING_DISABLED
