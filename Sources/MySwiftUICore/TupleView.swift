#warning("TODO")

@frozen public struct TupleView<T>: View {
    public nonisolated var value: T
    
    @inlinable public nonisolated init(_ value: T) {
        self.value = value
    }
    
    public static nonisolated func _makeView(view: _GraphValue<TupleView<T>>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<TupleView<T>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    public var body: Never {
        bodyError
    }
}

@available(*, unavailable)
extension TupleView : Sendable {
}
