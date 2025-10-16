#warning("TODO")
public import UIKit
internal import MySwiftUICore

open class UIHostingController<Content: View>: UIViewController {
    package final func _as<T>(_ type: T.Type) -> T? {
        fatalError("TODO")
    }
    
    final func _viewDidMoveToWindow() {
        fatalError("TODO")
    }
    
    final func preferencesDidChange(_: PreferenceValues) {
        fatalError("TODO")
    }
    
    final func update(_: inout EnvironmentValues) {
        fatalError("TODO")
    }
    
    final func updateViewGraphBridges(_: inout ViewGraphBridgeProperties) {
        fatalError("TODO")
    }
    
    final func didRender() {
        fatalError("TODO")
    }
    
    final var navigationBridge: NavigationBridge_PhoneTV? {
        fatalError("TODO")
    }
}

extension UIHostingController: @preconcurrency ViewGraphBridgePropertiesDelegate {
    final func resolveRequiredBridges(_: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) {
        fatalError("TODO")
    }
}
