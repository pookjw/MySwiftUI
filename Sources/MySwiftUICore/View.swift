#warning("TODO")

@_typeEraser(DebugReplaceableView) @_typeEraser(AnyView) @preconcurrency @MainActor public protocol View {
    static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs
    
    static nonisolated func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
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

extension View {
    static nonisolated func makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 = sp + 0x360
        /*
         view = w27
         self type = x22
         */
        // sp + 0x2a0
        let inputs_1 = inputs
        // sp + 0x240
        let fields = DynamicPropertyCache.fields(of: self.self)
        
        fatalError("TODO")
    }
}
