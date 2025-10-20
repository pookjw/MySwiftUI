#warning("TODO")

@preconcurrency @MainActor public protocol ViewModifier {
    static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
    
    static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int?
    
    associatedtype Body : View
    
    @ViewBuilder @MainActor @preconcurrency func body(content: Self.Content) -> Self.Body
    typealias Content = _ViewModifier_Content<Self>
}

extension ViewModifier {
    public static nonisolated func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
}

@MainActor protocol MultiViewModifier: ViewModifier {
    
}

@MainActor protocol PrimitiveViewModifier: ViewModifier {
    
} 

public struct _ViewModifier_Content<Modifier>: View where Modifier: ViewModifier {
    public static nonisolated func _makeView(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<_ViewModifier_Content<Modifier>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        fatalError("TODO")
    }
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    @_alwaysEmitIntoClient public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
//        _viewListCount(inputs: inputs) { _ in nil }
        fatalError("TODO")
    }
    
    public var body: some View {
        bodyError()
    }
}

extension ViewModifier {
    func bodyError() -> Never {
        fatalError()
    }
}
