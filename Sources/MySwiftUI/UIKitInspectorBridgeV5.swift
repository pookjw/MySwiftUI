@_spi(Internal) internal import MySwiftUICore
internal import UIKit

final class UIKitInspectorBridgeV5<T> : SheetBridge<SheetPreference.InspectorKey> {
    override var requiresTransparentHostKey: Bool {
        assertUnimplemented()
    }

    override init() {
        super.init()
    }
    
    override func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(SheetPreference.InspectorKey.self)
        viewGraph.addPreference(ContainerBackgroundKeys.HostTransparency.self)
    }
    
    func removePreferences(from graph: ViewGraph) {
        assertUnimplemented()
    }

    override func update(bridgeProperties: inout ViewGraphBridgeProperties) {
        assertUnimplemented()
    }

    override func update(presentation preference: SheetPreference, in viewController: PresentationHostingController<AnyView>, transaction: Transaction) {
        assertUnimplemented()
    }

    override func contingentlyPresent(_ preference: SheetPreference, from viewController: UIViewController, animated: Bool) {
        assertUnimplemented()
    }

    nonisolated override var isBackingV5Inspector: Bool {
        assertUnimplemented()
    }

    nonisolated override func willTransitionToRegularSizeClass() {
        assertUnimplemented()
    }
    
    // TODO
}
