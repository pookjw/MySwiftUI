@frozen public struct ForegroundStyle : ShapeStyle {
    @inlinable public init() {}
    
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, ForegroundStyle>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    public typealias Resolved = Never
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension ForegroundStyle {
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension ForegroundStyle : BitwiseCopyable {}
