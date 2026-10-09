#if SwiftUICompatibility
internal import SwiftUI
#endif

struct ForegroundMaterialStyle : ShapeStyle, PrimitiveShapeStyle {
#if SwiftUICompatibility
    var material: SwiftUI::Material
    
    init(material: SwiftUI::Material) {
        self.material = material
    }
#else
    var material: MySwiftUICore::Material
    
    init(material: MySwiftUICore::Material) {
        self.material = material
    }
#endif
    
    func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    static func _apply(to type: inout _ShapeStyle_ShapeType) {
        // noop
    }
}
