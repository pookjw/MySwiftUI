import CoreGraphics

package protocol Scrollable {
    func scroll<Item>(to item: Item) where Item: Hashable
    func setContentTarget(_ block: (ScrollGeometry, LayoutDirection) -> ScrollTarget?) -> Bool
    var allowsContentOffsetAdjustments: Bool { get }
    func adjustContentOffset(by size: CGSize, reason: ContentOffsetAdjustmentReason) -> Bool
    func mapFirstChild<Item, C>(ofType: Item.Type, body: (Item) -> C) -> C?
}

extension Scrollable {
    func scrollToPosition(_ position: ScrollPosition) {
        fatalError("TODO")
    }
}

package protocol ScrollableContainer: Scrollable {
    // TODO
}

package protocol ScrollableCollection: Scrollable {
    // TODO
}
