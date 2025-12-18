@_spi(Internal) internal import MySwiftUICore

protocol UIHostingViewProvider: AnyObject {
    var environmentOverride: EnvironmentValues? {
        get
        set
    }
    
    var eventBindingManager: EventBindingManager {
        get
    }
    
    var shouldCreateUIInteractions: Bool {
        get
    }
    
    var inspectorBridge: UIKitInspectorBridgeV3? {
        get
    }
    
    func renderForPreferences(updateDisplayList: Bool)
}
