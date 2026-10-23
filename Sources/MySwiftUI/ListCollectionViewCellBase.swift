@_spi(Internal) internal import MySwiftUICore
internal import UIKit

class ListCollectionViewCellBase<T : View>: AnyListCollectionViewCell {
    override var dragBridge: AnyDragAndDropBridge? {
        assertUnimplemented()
    }

    override var responderNode: ResponderNode? {
        assertUnimplemented()
    }

    override var identifiedViews: _IdentifiedViewTree {
        assertUnimplemented()
    }

    override var swipeActions: SwipeActions.Value? {
        assertUnimplemented()
    }

    override var secondaryNavigationBehavior: PlatformItemList.Item.SecondaryNavigationBehavior? {
        assertUnimplemented()
    }

    override func explicitAlignment(of alignment: HorizontalAlignment, at size: CGSize) -> CGFloat? {
        assertUnimplemented()
    }

    override func outermostContextMenuConfiguration() -> UIContextMenuConfiguration? {
        assertUnimplemented()
    }

    override init(frame: CGRect) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override var focusEffect: UIFocusEffect? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override var canBecomeFocused: Bool {
        assertUnimplemented()
    }

    override var isAccessibilityElement: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }

    override func removeFromSuperview() {
        assertUnimplemented()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        assertUnimplemented()
    }

    override func updateConfiguration(using state: UICellConfigurationState) {
        assertUnimplemented()
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        assertUnimplemented()
    }

    override func layoutSubviews() {
        assertUnimplemented()
    }
}
