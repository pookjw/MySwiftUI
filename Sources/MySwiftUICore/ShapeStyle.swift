#warning("TODO")

public protocol ShapeStyle: Sendable {
    @available(*, deprecated, message: "obsolete")
    static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    func _apply(to shape: inout _ShapeStyle_Shape)
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    static func _apply(to type: inout _ShapeStyle_ShapeType)
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    @_weakLinked associatedtype Resolved : ShapeStyle = Never
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    func resolve(in environment: EnvironmentValues) -> Self.Resolved
}

extension ShapeStyle {
    public static nonisolated func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        fatalError("TODO")
    }
    
    public func _apply(to shape: inout _ShapeStyle_Shape) {
        fatalError("TODO")
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        fatalError("TODO")
    }
}

extension ShapeStyle where Self.Resolved == Never {
    public func resolve(in environment: EnvironmentValues) -> Never {
        fatalError("TODO")
    }
    
    public static func _apply(to type: inout _ShapeStyle_ShapeType) {
        fatalError("TODO")
    }
}

extension Never: ShapeStyle {
    public typealias Resolved = Never
    
    public static nonisolated func _makeView<S>(view: _GraphValue<_ShapeView<S, Never>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape {
        fatalError("TODO")
    }
}

@usableFromInline
package class AnyShapeStyleBox: @unchecked Sendable {
    init() {}
    
    package func apply(to: inout _ShapeStyle_Shape) {
        // nop
    }
    
    package func isEqual(to other: AnyShapeStyleBox) -> Bool {
        return false
    }
}

public struct _ShapeStyle_Shape {
    
}

public struct _ShapeStyle_ShapeType {
    
}

@available(*, unavailable)
extension _ShapeStyle_ShapeType: Sendable {}
