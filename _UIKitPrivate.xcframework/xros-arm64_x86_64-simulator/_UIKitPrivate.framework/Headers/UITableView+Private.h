#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UITableView (Private)
- (void)_deselectRowsAtIndexPaths:(NSArray<NSIndexPath *> * _Nullable)indexPaths animated:(BOOL)animated transitionCoordinator:(id<UIViewControllerTransitionCoordinator>)transitionCoordinator;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
