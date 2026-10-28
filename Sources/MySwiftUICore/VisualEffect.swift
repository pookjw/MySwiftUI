public protocol VisualEffect : Sendable, Animatable {
    static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
    static func _makeTransform(effect: _GraphValue<Self>, inputs: _ViewInputs) -> _VisualEffectTransformOutputs
}

extension VisualEffect {
    public static func _makeTransform(effect: _GraphValue<Self>, inputs: _ViewInputs) -> _VisualEffectTransformOutputs {
        assertUnimplemented()
    }
    
    package func combining<Effect>(_ effect: Effect) -> ModifiedContent<Self, Effect> where Effect : VisualEffect {
        assertUnimplemented()
    }
}

public struct _VisualEffectTransformOutputs {
}

extension _VisualEffectTransformOutputs : Sendable {
}

public struct EmptyVisualEffect : VisualEffect {
    public init() {
    }
    
    public static func _makeVisualEffect(effect: _GraphValue<EmptyVisualEffect>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    public typealias AnimatableData = EmptyAnimatableData
}
