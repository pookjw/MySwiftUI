public import AttributeGraph
public import Spatial

@_spi(Internal) public protocol ContentResponder {
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64
    func contentPath(size: CGSize) -> Path
    func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path
}

extension _ViewOutputs {
    @_spi(Internal) public func makeContentPathPreferenceWriter<T : ContentResponder>(
        inputs: _ViewInputs,
        contentResponder: @autoclosure () -> Attribute<T>,
        kinds: OptionalAttribute<ContentShapeKinds> = OptionalAttribute()
    ) {
        // $s7SwiftUI12_ViewOutputsVAAE31makeContentPathPreferenceWriter6inputs16contentResponder5kindsyAA01_C6InputsV_14AttributeGraph0O0VyxGyXKAJ08OptionalO0VyAA0F10ShapeKindsVGtAA0fL0RzlF
        /*
         self = x19
         */
        guard inputs.preferences.contains(ContentShapePathData.self) else {
            return
        }
        
        assertUnimplemented()
    }
}


struct ContentShapePathData : PreferenceKey {
    static var defaultValue: ContentShapePathData? {
        return nil
    }
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        assertUnimplemented()
    }
    
    private var transform: Attribute<ViewTransform>?
    private var position: Attribute<CGPoint>?
    private var shapes: MergedContentShapes
}

struct MergedContentShapes {
    // TODO
}

package struct TrivialContentResponder : ContentResponder {
    package init() {}
    
    package func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    package func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    package func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
}
