#warning("TODO")
internal import MySwiftUICore
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
        fatalError("TODO")
    }
    
    var uiContainingViewController: UIViewController? {
        fatalError("TODO")
    }
    
    func setNeedsUpdate() {
        fatalError("TODO")
    }
    
    var hostingView: UIHostingViewProvider? {
        return self.as((UICoreViewControllerProvider & UIHostingViewProvider).self)
    }
}
