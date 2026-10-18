@_spi(Internal) public protocol CoreInteractionRepresentable {
    associatedtype InteractionView : CoreInteractionView
    
    static func appendFeature(to: inout CoreInteractionRepresentableFeatureBufferProxy)
    
    func appendInteractions(to: inout CoreInteractionRepresentableInteractionsProxy)
    
    func updateInteraction(_ interaction: AnyObject, tag: Int)
}

@_spi(Internal) public protocol CoreInteractionView {
}

@_spi(Internal) public struct CoreInteractionRepresentableFeatureBufferProxy {
}

@_spi(Internal) public struct CoreInteractionRepresentableInteractionsProxy {
}

extension CoreInteractionRepresentable {
    package static func appendFeature(to: inout CoreInteractionRepresentableFeatureBufferProxy) {
        assertUnimplemented()
    }
    
    package func appendInteractions(to: inout CoreInteractionRepresentableInteractionsProxy) {
        assertUnimplemented()
    }
    
    package func updateInteraction(_ interaction: AnyObject, tag: Int) {
        assertUnimplemented()
    }
}

extension View {
    package func coreInteractionRepresentable<T : CoreInteractionRepresentable>(_ representable: T) -> some View {
        self.modifier(
            CoreInteractionRepresentableModifier<T, Int>(
                representable: representable,
                id: -1
            )
        )
    }
    
    package func coreInteractionRepresentable<T : CoreInteractionRepresentable, U : Hashable>(_ representable: T, id: U) -> some View {
        self.modifier(
            CoreInteractionRepresentableModifier<T, U>(
                representable: representable,
                id: id
            )
        )
    }
}

struct CoreInteractionRepresentableModifier<T, U> : ViewModifier {
    private var representable: T?
    private var id: U
    
    init(representable: T?, id: U) {
        assertUnimplemented()
    }

    nonisolated static func _makeView(modifier: _GraphValue<CoreInteractionRepresentableModifier<T, U>>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}
