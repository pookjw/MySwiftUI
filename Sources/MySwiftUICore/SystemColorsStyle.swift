struct SystemColorsStyle : ShapeStyle, PrimitiveShapeStyle {
    init() {}
    
    func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    static func _apply(to type: inout _ShapeStyle_ShapeType) {
        // noop
    }
}
