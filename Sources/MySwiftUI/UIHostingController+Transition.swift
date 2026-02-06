// 2ADA36772BBE2FA4B0793F8DB8FE08F7
internal import UIKit
@_spi(Internal) private import MySwiftUICore

extension UIHostingController {
    final func prepareForNavigationTransition(_ animated: Bool) {
        // animated 안 씀
        // self -> x20 -> x19
        guard !host.isRendering else {
            return
        }
        
        guard !host.viewGraph.environment.isEagerNavigationTransitionEnabled else {
            return
        }
        
        // x22
        guard let navigationController else {
            return
        }
        
        guard navigationController.viewControllers.contains(where: { $0 == self }) else {
            return
        }
        
        updateIncomingBoundsIfNeeded(navigationController: navigationController)
        host.renderForPreferences(updateDisplayList: true)
    }
    
    final func coordinateListSelection(transitionCoordinator: UIViewControllerTransitionCoordinator?, isAnimated: Bool) {
        guard let transitionCoordinator else {
            return
        }
        
        // transitionCoordinator -> x19
        guard let scrollView = topOrBottomContentScrollView() else {
            return
        }
        
        // <+68>
        // scrollView -> sp + 0x8
        guard let toViewController = transitionCoordinator.viewController(forKey: .to) else {
            return
        }
        
        // <+112>
        // toViewController -> sp
        // x20
        guard let containingViewController = host.containingViewController else {
            return
        }
        
        // <+196>
        guard toViewController !== containingViewController else {
            return
        }
        
        // <+304>
        if let tableView = scrollView as? UITableView {
            // <+332>
            fatalError("TODO")
        } else if let collectionView = scrollView as? UpdateCoalescingCollectionView {
            // <+480>
            fatalError("TODO")
        }
    }
    
    final func updateIncomingBoundsIfNeeded(navigationController: UINavigationController) {
        fatalError("TODO")
    }
    
    fileprivate func topOrBottomContentScrollView() -> UIScrollView? {
        fatalError("TODO")
    }
}
