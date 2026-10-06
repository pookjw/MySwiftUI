@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct BackgroundStyle : ShapeStyle {
    @inlinable public init() {}
    
    nonisolated public static func _makeView<S>(view: _GraphValue<_ShapeView<S, BackgroundStyle>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, tvOS 14.0, watchOS 7.0, macOS 11.0, *)
    public typealias Resolved = Never
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ShapeStyle where Self == BackgroundStyle {
    @_alwaysEmitIntoClient public static var background: BackgroundStyle {
        get { .init() }
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension BackgroundStyle : BitwiseCopyable {}
