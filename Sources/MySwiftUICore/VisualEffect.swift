public protocol VisualEffect: Sendable, Animatable {
    static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
    static func _makeTransform(effect: _GraphValue<Self>, inputs: _ViewInputs) -> _VisualEffectTransformOutputs
}

extension VisualEffect {
    public static func _makeTransform(effect: _GraphValue<Self>, inputs: _ViewInputs) -> _VisualEffectTransformOutputs {
        fatalError("TODO")
    }
}

public struct _VisualEffectTransformOutputs {
}

extension _VisualEffectTransformOutputs: Sendable {
}
