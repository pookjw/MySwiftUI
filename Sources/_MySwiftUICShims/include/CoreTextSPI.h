#ifndef CoreTextSPI_h
#define CoreTextSPI_h

// https://github.com/WebKit/WebKit/blob/main/Source/WebCore/PAL/pal/spi/cf/CoreTextSPI.h

#import <CoreText/CoreText.h>

typedef CF_ENUM(uint8_t, CTCompositionLanguage)
{
    kCTCompositionLanguageUnset,
    kCTCompositionLanguageNone,
    kCTCompositionLanguageJapanese,
    kCTCompositionLanguageSimplifiedChinese,
    kCTCompositionLanguageTraditionalChinese,
};

#endif /* CoreTextSPI_h */