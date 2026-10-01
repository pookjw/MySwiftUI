#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Private)
- (CTFontRef _Nullable)_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:(UITraitCollection *)traitCollection;
@end

NS_ASSUME_NONNULL_END
