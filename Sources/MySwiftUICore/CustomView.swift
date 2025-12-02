// CE1D93D8ECBBEB5FE2E32E69A123E7CB
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
         Self = x21
         */
        // sp + 0x2a0
        let inputs_1 = inputs
        // sp + 0x240 / x24 + x25 + w26 + w28
        let fields = DynamicPropertyCache.fields(of: self.self)
        
        // <+124>
        // sp + 0x240
        var inputs_2 = inputs_1
        // sp + 0x180
        let fields_1 = fields
        // view -> sp + 0xc0
        // sp + 0x1e0
        let inputs_3 = inputs_1
        
        // <+184>
        let body = makeBody(view: view, inputs: &inputs_2.base, fields: fields_1)
        fatalError("TODO")
    }
}

extension View {
    fileprivate static nonisolated func makeBody(
        view: _GraphValue<Self>, // x2
        inputs: inout _GraphInputs, // x3
        fields: DynamicPropertyCache.Fields // x4
    ) -> (_GraphValue<Self.Body>, _DynamicPropertyBuffer)? {
        /*
         x29 = sp + 0x70
         
         view = x25
         inputs = x20
         fields = x24
         Self = x19
         */
        fatalError("TODO")
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
