protocol ViewGraphBridgePropertiesDelegate: AnyObject {
    func updateRequiredBridges(_ properties: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions) -> ViewGraphBridgeProperties
}

struct HostingControllerBridgeActions: OptionSet {
    static let unknown0 = HostingControllerBridgeActions(rawValue: 1 << 0)
    static let unknown1 = HostingControllerBridgeActions(rawValue: 1 << 1)
    
    let rawValue: Int
}
