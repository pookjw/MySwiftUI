public struct OpacityTransition: Transition {
    public typealias Body = Never
    
    public init() {
    }
    
    @MainActor @preconcurrency public func body(content: OpacityTransition.Content, phase: TransitionPhase) -> some View {
        // ModifiedContent<PlaceholderContentView<OpacityTransition>, OpacityRendererEffect>
        fatalError("TODO")
    }
    
//    @MainActor @preconcurrency public static let properties: TransitionProperties = {
//        fatalError("TODO")
//    }()
//    
//    @MainActor @preconcurrency public func _makeContentTransition(transition: inout _Transition_ContentTransition) {
//        fatalError("TODO")
//    }
}

@available(*, unavailable)
extension OpacityTransition: Sendable {
}

extension Transition where Self == OpacityTransition {
    @_alwaysEmitIntoClient @MainActor @preconcurrency public static var opacity: OpacityTransition {
        get { Self() }
    }
}

struct OpacityRendererEffect {
    private var opacity: Double
}
