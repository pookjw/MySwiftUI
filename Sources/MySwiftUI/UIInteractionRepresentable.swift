// 4A65CF26147421F79873D2D174FBF233
@_spi(Internal) package import MySwiftUICore
package import UIKit
private import _UIKitPrivate

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

    static func appendFeature(to proxy: inout CoreInteractionRepresentableFeatureBufferProxy) {
        assertUnimplemented()
    }

    func appendInteractions(to proxy: inout CoreInteractionRepresentableInteractionsProxy) {
        assertUnimplemented()
    }

    func updateInteraction(_ interaction: AnyObject, tag: Int) {
        assertUnimplemented()
    }
}

fileprivate class _UIInteractionView<Interaction : UIInteraction, Content : CoreInteractionRepresentable> : UIView, CoreInteractionView {
    var coreInteractions: CoreInteractionRepresentableInteractionsProxy

    override init(frame: CGRect) {
        assertUnimplemented()
    }

    override class func _supportsInvalidatingFocusCache() -> Bool {
        assertUnimplemented()
    }

    override func focusItems(in rect: CGRect) -> [any UIFocusItem] {
        assertUnimplemented()
    }

    init(coreInteractions: CoreInteractionRepresentableInteractionsProxy) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
}
