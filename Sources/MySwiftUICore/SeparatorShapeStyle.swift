@available(iOS 17.0, macOS 10.15, tvOS 17.0, watchOS 10.0, *)
extension ShapeStyle where Self == SeparatorShapeStyle {
    @_alwaysEmitIntoClient public static var separator: SeparatorShapeStyle {
        get { .init() }
    }
}

@available(iOS 17.0, macOS 10.15, tvOS 17.0, watchOS 10.0, *)
public struct SeparatorShapeStyle : ShapeStyle {
    public init() {}
    
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, SeparatorShapeStyle>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 10.15, *)
    public typealias Resolved = Never
}

@available(iOS 17.0, macOS 12.0, tvOS 17.0, watchOS 10.0, *)
extension SeparatorShapeStyle {
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}
