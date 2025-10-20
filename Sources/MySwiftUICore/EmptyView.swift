#warning("TODO")

public struct EmptyView: PrimitiveView {
    public var body: Never {
        fatalError("body() should not be called on EmptyView.")
    }
    
    public init() {
        #warning("TODO: Implement EmptyView")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<EmptyView>, inputs: _ViewInputs) -> _ViewOutputs {
        return _ViewOutputs()
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<EmptyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}
