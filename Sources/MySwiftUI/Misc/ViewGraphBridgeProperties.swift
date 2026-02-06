internal import MySwiftUICore

struct ViewGraphBridgeProperties {
    var suppliedBridges = HostingControllerBridges(rawValue: 0)
    private var managedBridges = HostingControllerBridges(rawValue: 0)
    private var requestedBars: Set<ToolbarPlacement.Role> = []
    private var managedBars: Set<ToolbarPlacement.Role> = []
}

struct HostingControllerBridges: OptionSet {
    let rawValue: Int
    
    static let unknown0 = HostingControllerBridges(rawValue: 1 << 0)
    static let unknown2 = HostingControllerBridges(rawValue: 1 << 2)
    static let unknown4 = HostingControllerBridges(rawValue: 1 << 4)
    static let unknown7 = HostingControllerBridges(rawValue: 1 << 7)
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
