#warning("TODO")
internal import Spatial
internal import CoreGraphics

protocol RendererLeafView: ContentResponder, PrimitiveView, UnaryView {
    static var requiresMainThread: Bool {
        get
    }
    
    func content() -> DisplayList.Content.Value
}

extension RendererLeafView {
    static func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        fatalError("TODO")
    }
    
    var requiresMainThread: Bool {
        fatalError("TODO")
    }
}
