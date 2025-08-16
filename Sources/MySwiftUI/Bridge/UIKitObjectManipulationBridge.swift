#warning("TODO")

internal import MySwiftUICore
internal import MRUIKit
internal import AttributeGraph

class UIKitObjectManipulationBridge<Content: View> {
    weak var host: _UIHostingView<Content>? = nil
    var mapping: [_MRUIObjectTransformInteraction.Target.ID: UIKitObjectManipulationBridge<Content>.Context] = [:]
    var proxyGeometries: [UUID : Attribute<ObjectManipulationGeometry>] = [:]
    var hasManipulationItemSeed: VersionSeed = .empty
}

extension UIKitObjectManipulationBridge {
    class Context {
        
    }
}
