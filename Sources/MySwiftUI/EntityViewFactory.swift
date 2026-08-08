internal import MySwiftUICore

protocol EntityViewFactory : PrimitiveView, UnaryView {
    associatedtype EntityType
    
    func makeEntity() -> Self.EntityType
    func updateEntity(_ entity: inout Self.EntityType, context: _EntityViewFactory_Context) -> _EntityViewFactory_Geometry
    var features: DisplayList.Features { get }
    static var shadowApplicationIsRecursive: Bool { get }
    static var wantsHitTestGeometry: Bool { get }
    var hostingComponent: AttachmentHostingComponent? { get }
}

extension EntityViewFactory {
    static func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    var hostingComponent: AttachmentHostingComponent? {
        assertUnimplemented()
    }
}

struct _EntityViewFactory_Context {
    // TODO
}

struct _EntityViewFactory_Geometry {
    // TODO
}
