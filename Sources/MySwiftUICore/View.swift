@_typeEraser(DebugReplaceableView) @_typeEraser(AnyView) @preconcurrency @MainActor public protocol View {
    static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs
    
    static nonisolated func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs
    
    static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int?
    
    associatedtype Body : View
    
    @ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }
} 

extension View {
    public static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        return makeView(view: view, inputs: inputs)
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension Never: View {
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension View {
    func bodyError() -> Never {
        fatalError("body() should not be called on \(_typeName(Self.self, qualified: false))")
    }
}

extension Optional: View where Wrapped : View {
    public typealias Body = Never
    
    public nonisolated static func _makeView(view: _GraphValue<Wrapped?>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public nonisolated static func _makeViewList(view: _GraphValue<Wrapped?>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    static var canTransition: Bool {
        fatalError("TODO")
    }
    
    // TODO
}

extension Optional: PrimitiveView where Wrapped : View {
}
