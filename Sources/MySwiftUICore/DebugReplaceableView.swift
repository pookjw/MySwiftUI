
public struct DebugReplaceableView: View {
    @_alwaysEmitIntoClient @_documentation(visibility: private) public init<V>(erasing view: V) where V : View {
        self.init(_erasing: view)
    }
    
    @usableFromInline
    init<V>(_erasing view: V) where V : View {
        assertUnimplemented()
    }
    
    public static nonisolated func _makeView(view: _GraphValue<DebugReplaceableView>, inputs: _ViewInputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<DebugReplaceableView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    public var body: Never
}

@available(*, unavailable)
extension DebugReplaceableView: Sendable {}
