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
    //  @ViewBuilder @MainActor @preconcurrency func body(content: Self.Content, phase: TransitionPhase) -> Self.Body
    @MainActor @preconcurrency static var properties: TransitionProperties { get }
    typealias Content = PlaceholderContentView<Self>
    //  @MainActor @preconcurrency func _makeContentTransition(transition: inout _Transition_ContentTransition)
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
