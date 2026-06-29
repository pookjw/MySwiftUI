#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CUIColorName) {
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

typedef NS_ENUM(NSUInteger, CUIDesignStyling) {
    CUIDesignStylingUnknown0 = 0,
    CUIDesignStylingUnknown1 = 1,
    CUIDesignStylingUnknown2 = 2
};

typedef struct CUIDesignColorTraits {
    NSUInteger value0;
    NSUInteger value1;
    CUIColorName colorName;
    NSUInteger value3;
    NSUInteger value4;
    NSUInteger value5;
    NSUInteger value6;
    CUIDesignStyling styling;
} CUIDesignColorTraits;

NS_ASSUME_NONNULL_END

#endif
