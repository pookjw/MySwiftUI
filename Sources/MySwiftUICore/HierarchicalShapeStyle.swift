@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct HierarchicalShapeStyle : ShapeStyle {
    package var id: UInt32
    
    public static let primary: HierarchicalShapeStyle = {
        assertUnimplemented()
    }()
    
    public static let secondary: HierarchicalShapeStyle = {
        assertUnimplemented()
    }()
    
    public static let tertiary: HierarchicalShapeStyle = {
        assertUnimplemented()
    }()
    
    public static let quaternary: HierarchicalShapeStyle = {
        assertUnimplemented()
    }()
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    public typealias Resolved = Never
    
    static let sharedPrimary: AnyShapeStyle = {
        assertUnimplemented()
    }()
}

@available(iOS 16.0, macOS 12.0, macCatalyst 15.0, tvOS 17.0, watchOS 10.0, *)
extension HierarchicalShapeStyle {
    public static let quinary: HierarchicalShapeStyle = {
        assertUnimplemented()
    }()
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension HierarchicalShapeStyle : BitwiseCopyable {}
