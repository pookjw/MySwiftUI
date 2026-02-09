// 2ADA36772BBE2FA4B0793F8DB8FE08F7
internal import UIKit
@_spi(Internal) internal import MySwiftUICore
private import _UIKitPrivate

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
            // x22
            let indexPathsForSelectedRows = tableView.indexPathsForSelectedRows
            tableView._deselectRows(at: indexPathsForSelectedRows, animated: true, transitionCoordinator: transitionCoordinator)
        } else if let collectionView = scrollView as? UpdateCoalescingCollectionView {
            // <+480>
            transitionCoordinator.animate { _ in
                
            } completion: { _ in
                // $s7SwiftUI19UIHostingControllerC23coordinateListSelection21transitionCoordinator10isAnimatedySo06UIViewd10TransitionI0_pSg_SbtFySo0ldmI7Context_pcfU0_TA
                fatalError("TODO")
            }
            
            let indexPathsForSelectedItems = collectionView.indexPathsForSelectedItems
            collectionView._deselectItems(at: indexPathsForSelectedItems, animated: true, transitionCoordinator: transitionCoordinator)
        }
    }
    
    final func updateIncomingBoundsIfNeeded(navigationController: UINavigationController) {
        fatalError("TODO")
    }
    
    fileprivate func topOrBottomContentScrollView() -> UIScrollView? {
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    @inline(__always)
    var internalNavigationEnabled: Bool {
        get {
            return self[InternalNavigationEnabledKey.self]
        }
        set {
            self[InternalNavigationEnabledKey.self] = newValue
        }
    }
}

fileprivate struct InternalNavigationEnabledKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}
