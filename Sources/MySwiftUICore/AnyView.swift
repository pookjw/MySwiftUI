#warning("TODO")

@frozen public struct AnyView: View {
    //    var storage: AnyViewStorageBase
    public init<V>(_ view: V) where V : View {
        fatalError("TODO")
    }
    
    @_alwaysEmitIntoClient public init<V>(erasing view: V) where V : View {
        self.init(view)
    }
    
    public init?(_fromValue value: Any) {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<AnyView>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public var body: Never {
        fatalError("TODO")
    } // TODO
}

@available(*, unavailable)
extension AnyView: Sendable {}
