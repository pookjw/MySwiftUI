@frozen public struct EmptyModifier: ViewModifier {
    public static let identity = EmptyModifier()
    
    public typealias Body = Never
    
    @inlinable public init() {}
    
    nonisolated public static func _makeView(modifier: _GraphValue<EmptyModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    nonisolated public static func _makeViewList(modifier: _GraphValue<EmptyModifier>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func body(content: EmptyModifier.Content) -> EmptyModifier.Body {
        assertUnimplemented()
    }
}

extension EmptyModifier: PrimitiveViewModifier {}
