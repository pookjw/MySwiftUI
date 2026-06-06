public protocol VisualEffect : Sendable, Animatable {
    nonisolated static func _makeVisualEffect(effect: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs
    nonisolated static func _makeTransform(effect: _GraphValue<Self>, inputs: _ViewInputs) -> _VisualEffectTransformOutputs
}

extension VisualEffect {
    public nonisolated static func _makeTransform(effect: _GraphValue<Self>, inputs: _ViewInputs) -> _VisualEffectTransformOutputs {
        assertUnimplemented()
    }
}

public struct _VisualEffectTransformOutputs {
}

extension _VisualEffectTransformOutputs : Sendable {
}
