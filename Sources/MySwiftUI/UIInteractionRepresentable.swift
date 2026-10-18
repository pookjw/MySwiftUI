// 4A65CF26147421F79873D2D174FBF233
@_spi(Internal) package import MySwiftUICore
package import UIKit

package protocol _UIInteractionRepresentable {
    associatedtype UIInteractionType : UIInteraction
    
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

fileprivate struct CoreInteractionRepresentableAdaptor<T : _UIInteractionRepresentable> : CoreInteractionRepresentable {
    typealias InteractionView = _UIInteractionView<T.UIInteractionType, Self>
    
    private(set) var base: T
}

fileprivate class _UIInteractionView<Interaction : UIInteraction, Content : CoreInteractionRepresentable> : UIView, CoreInteractionView {
    var coreInteractions: CoreInteractionRepresentableInteractionsProxy

    init(coreInteractions: CoreInteractionRepresentableInteractionsProxy) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
}
