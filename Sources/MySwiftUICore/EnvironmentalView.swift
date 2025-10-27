#warning("TODO")

protocol EnvironmentalView: PrimitiveView, UnaryView {
    associatedtype EnvironmentBody
    
    func body(environment: EnvironmentValues) -> EnvironmentBody
}

extension EnvironmentalView {
    public static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
}

protocol EnvironmentalModifier: ViewModifier {}

extension EnvironmentalModifier {
    static var _tracksEnvironmentDependencies: Bool {
        fatalError("TODO")
    }
    
    static var _requiresMainThread: Bool {
        fatalError("TODO")
    }
    
    static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}
