internal import MySwiftUICore
internal import AttributeGraph

struct ViewGraphBridgeProperties {
    @safe static nonisolated(unsafe) let defaultValue = ViewGraphBridgeProperties()
    
    var suppliedBridges = HostingControllerBridges(rawValue: 0)
    private var managedBridges = HostingControllerBridges(rawValue: 0)
    var requestedBars: Set<ToolbarPlacement.Role> = []
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
    @inline(__always)
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

extension _GraphInputs {
    @inline(__always)
    var viewGraphBridgeProperties: WeakAttribute<ViewGraphBridgeProperties> {
        get {
            return self[ViewGraphBridgePropertiesKey.self]
        }
        set {
            self[ViewGraphBridgePropertiesKey.self] = newValue
        }
    }
    
    fileprivate struct ViewGraphBridgePropertiesKey: ViewInput {
        @safe static nonisolated(unsafe) let defaultValue = WeakAttribute<ViewGraphBridgeProperties>()
    }
}
