#warning("TODO")

public protocol ShapeStyle: Sendable {
//    @available(*, deprecated, message: "obsolete")
//    static func _makeView<S>(view: _GraphValue<_ShapeView<S, Self>>, inputs: _ViewInputs) -> _ViewOutputs where S : Shape
//    
//    func _apply(to shape: inout _ShapeStyle_Shape)
//    
//    static func _apply(to type: inout _ShapeStyle_ShapeType)
    @_weakLinked associatedtype Resolved : ShapeStyle = Never
    
//    func resolve(in environment: EnvironmentValues) -> Self.Resolved
}

extension Never: ShapeStyle {
    public typealias Resolved = Never
}
