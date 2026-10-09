struct OffsetShapeStyle<T : ShapeStyle> : ShapeStyle {
    var base: T
    var offset: Int
    
    func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}
