#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>
#import <RenderBox/RBDisplayListContents.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBDisplayList : NSObject <_RBDisplayListContents>
@property (nonatomic) RBDisplayListContentsProfile profile;
@property (nonatomic) CGRect contentRect;
@property (nonatomic) CGFloat deviceScale;
@property (nonatomic, readonly) CGRect boundingRect;
@property (nonatomic) RBColorSpace defaultColorSpace;
- (id<RBDisplayListContents>)moveContents NS_RETURNS_RETAINED;
- (void)translateByX:(CGFloat)x Y:(CGFloat)y;
- (void)drawDisplayList:(id<RBDisplayListContents>)contents;
@end

RB_EXTERN RBDrawingState RBDisplayListGetState(RBDisplayList *displayList) NS_SWIFT_NAME(getter:RBDisplayList.state(self:));

NS_ASSUME_NONNULL_END
