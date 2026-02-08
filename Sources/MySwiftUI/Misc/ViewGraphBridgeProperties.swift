// 6A9F952779E4584C0EE738ADE92F1F31
internal import MySwiftUICore
internal import AttributeGraph

struct ViewGraphBridgeProperties: Equatable {
    fileprivate static var defaultRequestedBars: Set<ToolbarPlacement.Role> {
        var result = Set<ToolbarPlacement.Role>([.navigationBar])
        result.insert(.bottomOrnament)
        
        if _SemanticFeature<Semantics_v5>.isEnabled {
            result.insert(.bottomBar)
        }
        
        return result
    }
    
    @safe static nonisolated(unsafe) let defaultValue = ViewGraphBridgeProperties(suppliedBridges: [], managedBridges: [], requestedBars: [], managedBars: ViewGraphBridgeProperties.defaultRequestedBars)
    
    var suppliedBridges: HostingControllerBridges
    private(set) var managedBridges: HostingControllerBridges
    var requestedBars: Set<ToolbarPlacement.Role>
    private(set) var managedBars: Set<ToolbarPlacement.Role>
}

struct HostingControllerBridges: OptionSet {
    let rawValue: Int
    
    static let unknown0 = HostingControllerBridges(rawValue: 1 << 0)
    static let unknown1 = HostingControllerBridges(rawValue: 1 << 1)
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
        return ViewGraphBridgeProperties(suppliedBridges: [], managedBridges: [], requestedBars: [], managedBars: ViewGraphBridgeProperties.defaultRequestedBars)
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
