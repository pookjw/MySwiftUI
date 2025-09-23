#warning("TODO")

protocol ViewGraphBridgePropertiesDelegate: AnyObject {
    func resolveRequiredBridges(_: ViewGraphBridgeProperties?, allowedActions: HostingControllerBridgeActions)
}

struct HostingControllerBridgeActions: OptionSet {
    static let unknown1 = HostingControllerBridgeActions(rawValue: 1 << 0)
    static let unknown2 = HostingControllerBridgeActions(rawValue: 1 << 1)
    
    let rawValue: UInt32
}
