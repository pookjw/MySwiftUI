#warning("TODO")

public struct DebugReplaceableView: View {
    @_alwaysEmitIntoClient @_documentation(visibility: private) public init<V>(erasing view: V) where V : View {
        self.init(_erasing: view)
    }
    
    @usableFromInline
    init<V>(_erasing view: V) where V : View {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<DebugReplaceableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    public var body: Never
}

@available(*, unavailable)
extension DebugReplaceableView: Sendable {}
