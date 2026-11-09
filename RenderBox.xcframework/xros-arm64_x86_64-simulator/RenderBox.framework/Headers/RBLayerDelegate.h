#import <Foundation/Foundation.h>
#import <RenderBox/RBLayer.h>
#import <RenderBox/RBDevice.h>
#import <RenderBox/RBDisplayList.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RBLayerDelegate <CALayerDelegate>
@optional
- (RBDevice * _Nullable)RBLayerDefaultDevice:(RBLayer *)layer;
- (void)RBLayer:(RBLayer *)layer draw:(RBDisplayList *)displayList NS_SWIFT_NAME(rbLayerDraw(_:inDisplayList:));
@end

NS_ASSUME_NONNULL_END
