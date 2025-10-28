#warning("TODO")
private import AttributeGraph

protocol EnvironmentalView: PrimitiveView, UnaryView {
    associatedtype EnvironmentBody : View
    
    func body(environment: EnvironmentValues) -> EnvironmentBody
}

extension EnvironmentalView {
    public static nonisolated func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         x29 = sp + 0x260
         x27 = sp + 0x70
         */
        /*
         view = w20
         x22 = Self
         */
        // sp + 0x1a0
        var copy = inputs
        // x24
        let child = EnvironmentalViewChild(view: view.value, env: copy.base.environment)
        let attribute = Attribute(child)
        let outputs = EnvironmentBody.makeDebuggableView(view: _GraphValue(attribute), inputs: inputs)
        
        return outputs
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

struct EnvironmentalViewChild<Content: EnvironmentalView>: AsyncAttribute, CustomStringConvertible, StatefulRule {
    @Attribute private var view: Content
    @Attribute private var env: EnvironmentValues
    private let tracker: PropertyList.Tracker
    
    fileprivate init(view: Attribute<Content>, env: Attribute<EnvironmentValues>) {
        self.tracker = PropertyList.Tracker()
        self._view = view
        self._env = env
    }
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = Content.EnvironmentBody
    
    func updateValue() {
        fatalError("TODO")
    }
}
