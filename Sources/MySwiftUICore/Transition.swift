struct CanTransitionTraitKey : _ViewTraitKey {
    static var defaultValue: Bool {
        return false
    }
}

struct TransitionTraitKey : _ViewTraitKey {
    @safe nonisolated(unsafe) static let defaultValue = AnyTransition.opacity
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
       assertUnimplemented()
     }
    
    @MainActor @preconcurrency public func _makeContentTransition(transition: inout _Transition_ContentTransition) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func apply<V>(content: V, phase: TransitionPhase) -> some View where V : View {
        assertUnimplemented()
    }
}

extension Transition {
    @MainActor @preconcurrency public func animation(_ animation: Animation?) -> some Transition {
        assertUnimplemented()
        return OpacityTransition()
    }
}

extension Transition {
    @MainActor @preconcurrency public func combined<T>(with other: T) -> some Transition where T : Transition {
        assertUnimplemented()
        return OpacityTransition()
    }
}

extension Transition {
    nonisolated static func makeView(view: _GraphValue<Self.Body>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
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

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct ContentTransition : Equatable, Sendable {
    // TODO
}
