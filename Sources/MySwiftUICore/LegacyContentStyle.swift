struct LegacyContentStyle : ShapeStyle, PrimitiveShapeStyle {
    static let sharedPrimary: AnyShapeStyle = {
        assertUnimplemented()
    }()
    
    var id: ContentStyle.ID
    var color: Color
    
    func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    static func _apply(to type: inout _ShapeStyle_ShapeType) {
        // noop
    }
}
