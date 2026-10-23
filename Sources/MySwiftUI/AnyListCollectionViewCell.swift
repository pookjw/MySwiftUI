internal import UIKit
@_spi(Internal) internal import MySwiftUICore

class AnyListCollectionViewCell : UICollectionViewListCell {
    var dragBridge: AnyDragAndDropBridge? {
        assertUnimplemented()
    }

    var responderNode: ResponderNode? {
        assertUnimplemented()
    }

    var identifiedViews: _IdentifiedViewTree {
        assertUnimplemented()
    }

    var swipeActions: SwipeActions.Value? {
        assertUnimplemented()
    }

    var secondaryNavigationBehavior: PlatformItemList.Item.SecondaryNavigationBehavior? {
        assertUnimplemented()
    }

    func explicitAlignment(of alignment: HorizontalAlignment, at size: CGSize) -> CGFloat? {
        assertUnimplemented()
    }

    func outermostContextMenuConfiguration() -> UIContextMenuConfiguration? {
        assertUnimplemented()
    }

    override init(frame: CGRect) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
}
