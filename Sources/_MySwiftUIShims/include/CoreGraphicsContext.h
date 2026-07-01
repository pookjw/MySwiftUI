#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

@interface MySwiftUI_CoreGraphicsContext : NSObject
+ (MySwiftUI_CoreGraphicsContext *)current;
@property (nonatomic, readonly) CGContextRef CGContext;
- (instancetype)initWithCGContext:(CGContextRef)context;
- (BOOL)__createsImages;
- (void)pop;
- (void)push;
@end

NS_ASSUME_NONNULL_END
