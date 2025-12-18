@_spi(Internal) internal import MySwiftUICore
internal import MRUIKit
internal import AttributeGraph

final class UIKitObjectManipulationBridge<Content: View>: AnyObjectManipulationBridge {
    weak var host: _UIHostingView<Content>? = nil
    var mapping: [_MRUIObjectTransformInteraction.Target.ID: UIKitObjectManipulationBridge<Content>.Context] = [:]
    var proxyGeometries: [UUID : Attribute<ObjectManipulationGeometry>] = [:]
    var hasManipulationItemSeed: VersionSeed = .empty
    
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(HasObjectManipulationKey.self)
        viewGraph.addPreference(ManipulationTargetGeometryPreferenceKey.self)
    }
    
    func preferencesDidChange(_ preferenceValues: PreferenceValues) {
        /*
         self = x19
         preferenceValues = x22
         */
        // x23
        let hasObjectManipulation = preferenceValues[HasObjectManipulationKey.self]
        updateState(hasManipulationItem: hasObjectManipulation)
        
        let manipulationTargetGeometryPreference = preferenceValues[ManipulationTargetGeometryPreferenceKey.self]
        self.proxyGeometries = manipulationTargetGeometryPreference.value
    }
    
    func updateEnvironment(_ environmentValues: inout EnvironmentValues) {
        environmentValues.objectManipulationBridge = ObjectManipulationBridgeWrapper(bridge: self)
    }
    
    private func updateState(hasManipulationItem: PreferenceValues.Value<Bool>) {
        guard let host else {
            return
        }
        
        guard let uiView = host.uiView else {
            return
        }
        
        guard !hasManipulationItem.seed.matches(hasManipulationItemSeed) else {
            return
        }
        
        // <+368>
        fatalError("TODO")
    }
}

extension UIKitObjectManipulationBridge {
    class Context {
        
    }
}
