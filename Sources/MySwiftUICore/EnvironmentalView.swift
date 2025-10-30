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
        let copy = inputs
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
        // x29 = sp + 0x1b0
        // sp + 0x98
        let tracker = self.tracker
        // x25 / sp + 0x78, x24
        let (view, viewFlags) = $view.valueAndFlags(options: [])
        // x27 + x22, x19
        let (env, envFlags) = $env.valueAndFlags(options: [])
        
        if viewFlags != .changed {
            // <+560>
            let hasDiff: Bool
            if envFlags != .unchanged {
                if tracker.hasDifferentUsedValues(env.plist) {
                    hasDiff = true 
                } else {
                    hasDiff = !hasValue
                }
            } else {
                hasDiff = !hasValue
            }
            
            guard hasDiff else {
                return
            }
        }
        
        // <+708>
        tracker.reset()
        tracker.initializeValues(from: env.plist)
        
        // 원래는 view만 UncheckedSendable
        let body = Signpost.bodyInvoke.traceInterval(
            object: nil,
            "%{public}@.body [in %{public}@]",
            [
                TypeID(Content.self).description,
                Tracing.libraryName(defining: Content.self)
            ]
        ) { [unchecked = UncheckedSendable((view, env))] in
            // $s7SwiftUI22EnvironmentalViewChildV11updateValueyyF15EnvironmentBodyQzyXEfU_ 
            return MainActor.assumeIsolated {
                let view = unchecked.value.0
                let env = unchecked.value.1
                let body = view.body(environment: env)
                return UncheckedSendable(body)
            }
        }.value
        
        self.value = body
    }
}
