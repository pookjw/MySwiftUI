@_spi(Internal) internal import MySwiftUICore
internal import UIKit
internal import _UIKitShims

extension ViewGraphDelegate {
    @MainActor var uiViewController: UIViewController? {
        return self.as(UICoreViewControllerProvider.self)?.containingViewController
    }
    
    var uiView: UIView? {
        return self.as(UIView.self)
    }
    
    var uiPresenterViewController: UIViewController? {
        fatalError("TODO")
    }
    
    var inspectorBridge: UIKitInspectorBridgeV3? {
        fatalError("TODO")
    }
    
    var environmentOverride: EnvironmentValues? {
        fatalError("TODO")
    }
    
    var shouldCreateUIInteractions: Bool {
        guard let hostingView else {
            return false
        }
        return hostingView.shouldCreateUIInteractions
    }
    
    var hosintingView: UIHostingViewProvider? {
        fatalError("TODO")
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
        fatalError("TODO")
    }
    
    var hostingView: UIHostingViewProvider? {
        return self.as(UIHostingViewProvider.self)
    }
}
