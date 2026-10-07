@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct HierarchicalShapeStyle : ShapeStyle {
    package var id: UInt32
    
    public static let primary = HierarchicalShapeStyle(id: 0)
    public static let secondary = HierarchicalShapeStyle(id: 1)
    public static let tertiary = HierarchicalShapeStyle(id: 2)
    public static let quaternary = HierarchicalShapeStyle(id: 3)
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Resolved = Never
    
    static let sharedPrimary = AnyShapeStyle(HierarchicalShapeStyle.primary)
}

@available(iOS 16.0, macOS 12.0, macCatalyst 15.0, tvOS 17.0, watchOS 10.0, *)
extension HierarchicalShapeStyle {
    public static let quinary = HierarchicalShapeStyle(id: 4)
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HierarchicalShapeStyle : BitwiseCopyable {}
