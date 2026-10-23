// 241B1548FB48B9561AEF74EC402F6941

extension MySwiftUICore::_ShapeStyle_Shape {
    // 원래 없음
    @inline(always)
    func resolveStyle(level: Int, material: Material, color: Color) -> _ShapeStyle_Pack.Style {
        return self.resolveStyle(id: ContentStyle.ID(truncatingLevel: level), material: material, color: color)
    }
    
    fileprivate func resolveStyle(id: ContentStyle.ID, material: Material, color: Color) -> _ShapeStyle_Pack.Style {
        assertUnimplemented()
    }
}
