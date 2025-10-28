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
    static nonisolated func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 = sp + 0x1a0
        /*
         view = w27
         
         */
        fatalError("TODO")
    }
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        fatalError("TODO")
    }
    
    static var requiresMainThread: Bool {
        fatalError("TODO")
    }
}
