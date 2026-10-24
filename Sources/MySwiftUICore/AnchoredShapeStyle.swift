public import CoreGraphics

@frozen public struct _AnchoredShapeStyle<S> : ShapeStyle where S : ShapeStyle {
    public var style: S
    public var bounds: CGRect
    
    @inlinable internal init(style: S, bounds: CGRect) {
        self.style = style
        self.bounds = bounds
    }
    
    nonisolated public static func _makeView<T>(view: _GraphValue<_ShapeView<T, _AnchoredShapeStyle<S>>>, inputs: _ViewInputs) -> _ViewOutputs where T : Shape {
        assertUnimplemented()
    }
    
    public typealias Resolved = Never
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension _AnchoredShapeStyle {
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        assertUnimplemented()
    }
}

extension ShapeStyle {
    @inlinable public func `in`(_ rect: CGRect) -> some ShapeStyle {
        return _AnchoredShapeStyle(style: self, bounds: rect)
    }
}
