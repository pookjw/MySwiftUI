#warning("TODO")
internal import AttributeGraph

protocol ContentResponder {}

extension _ViewOutputs {
    func makeContentPathPreferenceWriter<T: ContentResponder>(
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
        
        fatalError("TODO")
    }
}


struct ContentShapePathData: PreferenceKey {
    static var defaultValue: ContentShapePathData? {
        return nil
    }
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        fatalError("TODO")
    }
    
    private var transform: Attribute<ViewTransform>?
    private var position: Attribute<CGPoint>?
    private var shapes: MergedContentShapes
}

struct MergedContentShapes {
    // TODO
}
