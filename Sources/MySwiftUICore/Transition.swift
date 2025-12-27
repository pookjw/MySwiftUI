struct CanTransitionTraitKey: _ViewTraitKey {
    static var defaultValue: Bool {
        return false
    }
}

struct TransitionTraitKey: _ViewTraitKey {
    @safe static nonisolated(unsafe) let defaultValue = AnyTransition.opacity
}

@preconcurrency @MainActor public protocol Transition {
    associatedtype Body : View
    @ViewBuilder @MainActor @preconcurrency func body(content: Self.Content, phase: TransitionPhase) -> Self.Body
    @MainActor @preconcurrency static var properties: TransitionProperties { get }
    typealias Content = PlaceholderContentView<Self>
    @MainActor @preconcurrency func _makeContentTransition(transition: inout _Transition_ContentTransition)
}

extension Transition {
     @MainActor @preconcurrency public static var properties: TransitionProperties {
       fatalError("TODO")
     }
    
    @MainActor @preconcurrency public func _makeContentTransition(transition: inout _Transition_ContentTransition) {
        fatalError("TODO")
    }
    
    @MainActor @preconcurrency public func apply<V>(content: V, phase: TransitionPhase) -> some View where V : View {
        fatalError("TODO")
    }
}

extension Transition {
    @MainActor @preconcurrency public func animation(_ animation: Animation?) -> some Transition {
        fatalError("TODO")
        return OpacityTransition()
    }
}

extension Transition {
    @MainActor @preconcurrency public func combined<T>(with other: T) -> some Transition where T : Transition {
        fatalError("TODO")
        return OpacityTransition()
    }
}

extension Transition {
    static nonisolated func makeView(view: _GraphValue<Self.Body>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var copy = inputs
        copy.pushModifierBody(PlaceholderContentView<Self>.self, body: body)
        return Self.Body.makeDebuggableView(view: view, inputs: copy)
    }
}

public struct TransitionProperties : Swift.Sendable {
    public init(hasMotion: Bool = true) {
        self.hasMotion = hasMotion
    }
    
    public var hasMotion: Bool
    
    func union(_ other: TransitionProperties) -> TransitionProperties {
        return TransitionProperties(hasMotion: hasMotion || other.hasMotion)
    }
}
