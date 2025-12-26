internal import CoreGraphics

public struct OpacityTransition: Transition {
    public init() {
    }
    
    @MainActor @preconcurrency public func body(content: OpacityTransition.Content, phase: TransitionPhase) -> some View {
        return ModifiedContent(
            content: PlaceholderContentView<Self>(),
            modifier: OpacityRendererEffect(opacity: 1)
        )
    }
    
    @MainActor @preconcurrency public static var properties: TransitionProperties {
        return TransitionProperties(hasMotion: false)
    }
    
    @MainActor @preconcurrency public func _makeContentTransition(transition: inout _Transition_ContentTransition) {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension OpacityTransition: Sendable {
}

extension Transition where Self == OpacityTransition {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var opacity: OpacityTransition {
        get { Self() }
    }
}

struct OpacityRendererEffect: RendererEffect, _RemoveGlobalActorIsolation {
    var opacity: Double
    
    init(opacity: Double) {
        self.opacity = opacity
    }
    
    init(isHidden: Bool) {
        opacity = isHidden ? 0 : 1
    }
    
    var animatableData: Double {
        get {
            return opacity
        }
        set {
            opacity = newValue
        }
        _modify {
            yield &opacity
        }
    }
    
    func effectValue(size: CGSize) -> DisplayList.Effect {
        return .opacity(Float(opacity))
    }
    
    static nonisolated func _makeView(modifier: _GraphValue<OpacityRendererEffect>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        if inputs.preferences.contains(DisplayList.Key.self) {
            var modifier = modifier
            _makeAnimatable(value: &modifier, inputs: inputs.base)
            return _makeRendererEffect(effect: modifier, inputs: inputs, body: body)
        } else {
            return body(_Graph(), inputs)
        }
    }
}
