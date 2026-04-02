#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UICollectionView (Private)
- (void)_deselectItemsAtIndexPaths:(NSArray<NSIndexPath *> * _Nullable)indexPaths animated:(BOOL)animated transitionCoordinator:(id<UIViewControllerTransitionCoordinator>)transitionCoordinator;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
