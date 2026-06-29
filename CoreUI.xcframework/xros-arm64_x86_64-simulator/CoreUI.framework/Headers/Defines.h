#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CUIColorName) {
    CUIColorNameRed = 0,
    CUIColorNameOrange = 1,
    CUIColorNameYellow = 2,
    CUIColorNameGreen = 3,
    CUIColorNameTeal = 4,
    CUIColorNameMint = 5,
    CUIColorNameCyan = 6,
    CUIColorNameBlue = 7,
    CUIColorNameIndigo = 8,
    CUIColorNamePurple = 9,
    CUIColorNamePink = 10,
    CUIColorNameBrown = 14,
    CUIColorNameGray = 13,
    CUIColorNamePrimary = 15,
    CUIColorNameSecondary = 16,
    CUIColorNameTertiary = 17,
    CUIColorNameQuaternary = 18,
    CUIColorNameQuinary = 19
};

typedef NS_ENUM(NSInteger, CUIDesignStyling) {
    CUIDesignStylingUnknown0 = 0,
    CUIDesignStylingUnknown1 = 1,
    CUIDesignStylingUnknown2 = 2
};

typedef NS_ENUM(NSInteger, CUIDisplayGamut) {
    CUIDisplayGamutSRGB = 0,
    CUIDisplayGamutDisplayP3 = 1
};

typedef NS_ENUM(NSInteger, CUIContrast) {
    CUIContrastStandard = 0,
    CUIContrastIncreased = 1
};

typedef NS_ENUM(NSInteger, CUIColorScheme) {
    CUIColorSchemeLight = 0,
    CUIColorSchemeDark = 1
};

typedef struct CUIDesignColorTraits {
    CUIColorName colorName;
    NSInteger value0;
    NSInteger value1;
    CUIColorScheme colorScheme;
    CUIContrast contrast;
    CUIDesignStyling styling;
    CUIDisplayGamut gamut;
    NSInteger value2;
} CUIDesignColorTraits;

NS_ASSUME_NONNULL_END

#endif
