#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface CUIDesignColor : NSObject
@property (nonatomic, readonly) CGColorRef cgColor;
@property (nonatomic, readonly) CGBlendMode blendMode;
@end

NS_ASSUME_NONNULL_END
