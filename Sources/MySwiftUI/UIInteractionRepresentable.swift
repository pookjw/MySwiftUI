// 4A65CF26147421F79873D2D174FBF233
package import MySwiftUICore

package protocol _UIInteractionRepresentable {
    associatedtype UIInteractionType
    
    func makeUIInteraction() -> Self.UIInteractionType
    func updateUIInteraction(_ interacton: Self.UIInteractionType)
}

extension View {
    package func interactionRepresentable<T : _UIInteractionRepresentable>(_ representable: T) -> some View {
        self.coreInteractionRepresentable(
            CoreInteractionRepresentableAdaptor(base: representable)
        )
    }
}

fileprivate struct CoreInteractionRepresentableAdaptor<T> : CoreInteractionRepresentable {
    typealias InteractionView = T // TODO
    
    private(set) var base: T
}
