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
        return box.hasMotion
    }
    
    @safe public static nonisolated(unsafe) let opacity: AnyTransition = MainActor.assumeIsolated { 
        return UncheckedSendable(AnyTransition(.opacity))
    }.value
    
    func visitBase<Visitor: TransitionVisitor>(applying visitor: inout Visitor) {
        return box.visitBase(applying: &visitor)
    }
}

@available(*, unavailable)
extension AnyTransition: Sendable {
}

@usableFromInline
class AnyTransitionBox {
    var isIdentity: Bool {
        fatalError() // abstract
    }
    
    var hasMotion: Bool {
        fatalError() // abstract
    }
    
    func visitBase<Visitor: TransitionVisitor>(applying visitor: inout Visitor) {
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
    
    override var hasMotion: Bool {
        return T.properties.hasMotion
    }
    
    override func visitBase<Visitor: TransitionVisitor>(applying visitor: inout Visitor) {
        fatalError("TODO")
    }
    
    // TODO
}

extension AnyTransition {
    public func animation(_ animation: Animation?) -> AnyTransition {
        fatalError("TODO")
    }
}

protocol TransitionVisitor {
    // TODO
}
