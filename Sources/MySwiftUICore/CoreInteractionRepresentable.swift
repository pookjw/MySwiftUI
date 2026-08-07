package protocol CoreInteractionRepresentable {
    associatedtype InteractionView
    
    // TODO
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
    
    func body(content: Content) -> some View {
        assertUnimplemented()
    }
}
