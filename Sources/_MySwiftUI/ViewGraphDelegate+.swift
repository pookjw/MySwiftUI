@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import _UIKitShims

extension ViewGraphDelegate {
    @MainActor var uiViewController: UIViewController? {
        return self.as(UICoreViewControllerProvider.self)?.coreUIViewController
    }
    
    var uiView: UIView? {
        return self.as(UIView.self)
    }
    
    @MainActor var uiPresenterViewController: UIViewController? {
        return self.as(UICoreViewControllerProvider.self)?.containingViewController
    }
    
    var popoverBridge: UIKitPopoverBridge? {
        assertUnimplemented()
    }
    
    var environmentOverride: EnvironmentValues? {
        get {
            fatalError("존재하지 않으며 아래 구현은 추정")
            guard let hostingView else {
                return nil
            }
            
            return hostingView.environmentOverride
        }
        set {
            guard let hostingView else {
                return
            }
            
            hostingView.environmentOverride = newValue
        }
    }
    
    var shouldCreateUIInteractions: Bool {
        guard let hostingView else {
            return false
        }
        return hostingView.shouldCreateUIInteractions
    }
    
    var hosintingView: UIHostingViewProvider? {
        assertUnimplemented()
    }
    
    var hostingControllerOverrides: HostingControllerOverrides {
        if let controller = self.as(UIHostingControllerProvider.self) {
            return controller.hostingControllerOverrides
        } else {
            // <+100>
            return HostingControllerOverrides()
        }
    }
    
    @MainActor var uiContainingViewController: UIViewController? {
        guard let provider = self.as(UICoreViewControllerProvider.self) else {
            return nil
        }
        
        return provider.containingViewController
    }
    
    func setNeedsUpdate() {
        assertUnimplemented()
    }
    
    var hostingView: UIHostingViewProvider? {
        return self.as(UIHostingViewProvider.self)
    }
}
