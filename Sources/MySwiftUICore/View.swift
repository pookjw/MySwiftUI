internal import AttributeGraph

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
        return makeViewList(view: view, inputs: inputs)
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
        /*
         view -> w24
         inputs -> x21
         */
        // sp + 0x30
        let metadata = makeConditionalMetadata(ViewDescriptor.self)
        // sp + 0x10
        let copy_1 = metadata
        return makeDynamicViewList(metadata: copy_1, view: view, inputs: inputs)
    }
    
    public nonisolated static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension Optional: PrimitiveView where Wrapped : View {
}

extension Optional: DynamicView where Wrapped : View {
    static var canTransition: Bool {
        return true
    }
    
    func childInfo(metadata: ConditionalMetadata<ViewDescriptor>) -> (any Any.Type, UniqueID?) {
        return withUnsafePointer(to: self) { pointer in
            return metadata.childInfo(ptr: pointer, emptyType: EmptyView.self)
        }
    }
    
    func makeChildView(metadata: ConditionalMetadata<ViewDescriptor>, view: Attribute<Optional<Wrapped>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    func makeChildViewList(metadata: ConditionalMetadata<ViewDescriptor>, view: Attribute<Optional<Wrapped>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        return withUnsafePointer(to: self) { pointer in
            return metadata.makeViewList(ptr: pointer, view: view, inputs: inputs)
        }
    }
}
