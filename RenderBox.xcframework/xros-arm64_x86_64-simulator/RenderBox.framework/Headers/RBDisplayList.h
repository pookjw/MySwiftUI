#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/RBDisplayListContents.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBDisplayList : NSObject
@property (nonatomic) RBDisplayListContentsProfile profile;
@property (nonatomic) CGRect contentRect;
@property (nonatomic) CGFloat deviceScale;
@property (nonatomic, readonly) CGRect boundingRect;
@property (nonatomic) RBColorSpace defaultColorSpace;
- (id<RBDisplayListContents>)moveContents NS_RETURNS_RETAINED;
- (void)translateByX:(CGFloat)x Y:(CGFloat)y;
@end

RB_EXTERN RBDrawingState RBDisplayListGetState(RBDisplayList *displayList);

NS_ASSUME_NONNULL_END
