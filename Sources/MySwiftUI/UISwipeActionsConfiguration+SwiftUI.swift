internal import UIKit
@_spi(Internal) internal import MySwiftUICore

extension UISwipeActionsConfiguration {
    convenience init(
        configuration: SwipeActions.Configuration,
        graphHost: GraphHost?,
        performDestructiveAction: @escaping (@escaping (Bool) -> Void) -> Void
    ) {
        assertUnimplemented()
    } 
}
