@_spi(Internal) internal import MySwiftUICore

final class UIKitInspectorBridgeV5<T>: SheetBridge<T> {
    override init() {
        super.init()
    }
    
    override func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(SheetPreference.InspectorKey.self)
        viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
    }
    
    override func removePreferences(from graph: ViewGraph) {
        assertUnimplemented()
    }
    
    // TODO
}
