internal import MySwiftUICore

struct ViewGraphBridgeProperties {
    private var suppliedBridges = HostingControllerBridges(rawValue: 0)
    private var managedBridges = HostingControllerBridges(rawValue: 0)
    private var requestedBars: Set<ToolbarPlacement.Role> = []
    private var managedBars: Set<ToolbarPlacement.Role> = []
}

struct HostingControllerBridges: OptionSet {
    let rawValue: Int
}

extension EnvironmentValues {
    // 원래 없음
    var viewGraphBridgeProperties: ViewGraphBridgeProperties {
        get {
            return self[BridgePropertiesEnvironmentKey.self]
        }
        set {
            self[BridgePropertiesEnvironmentKey.self] = newValue
        }
    }
}

fileprivate struct BridgePropertiesEnvironmentKey: EnvironmentKey {
    static var defaultValue: ViewGraphBridgeProperties {
        return ViewGraphBridgeProperties()
    }
}
