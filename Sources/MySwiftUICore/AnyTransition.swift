// 142ABD4E569D763299C4081019352BCD
@frozen public struct AnyTransition {
    fileprivate let box: AnyTransitionBox
    
    public init<T: Transition>(_ transition: T) {
        box = TransitionBox(transition)
    }
    
    var isIdentity: Bool {
        return box.isIdentity
    }
    
    var hasMotion: Bool {
        fatalError("TODO")
    }
    
    @safe public static nonisolated(unsafe) let opacity: AnyTransition = MainActor.assumeIsolated { 
        return UncheckedSendable(AnyTransition(.opacity))
    }.value
}

@available(*, unavailable)
extension AnyTransition: Sendable {
}

@usableFromInline
class AnyTransitionBox {
    var isIdentity: Bool {
        fatalError() // abstract
    }
    
    // TODO
}

@available(*, unavailable)
extension AnyTransitionBox: Sendable {
}

fileprivate final class TransitionBox<T: Transition>: AnyTransitionBox {
    private let base: T
    
    init(_ base: T) {
        self.base = base
    }
    
    override var isIdentity: Bool {
        return T.Body.self == T.Content.self
    }
    
    // TODO
}

extension AnyTransition {
    public func animation(_ animation: Animation?) -> AnyTransition {
        fatalError("TODO")
    }
}
