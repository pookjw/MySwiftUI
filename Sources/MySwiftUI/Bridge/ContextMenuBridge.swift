#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class ContextMenuBridge: NSObject {
    weak var host: (any ViewRendererHost)? = nil
    var interaction: UIContextMenuInteraction? = nil
    var menuOrder: MenuOrder = .automatic
    var hasContextMenuSeed: VersionSeed = .empty
    var menuOrderSeed: VersionSeed = .empty
    var inspectorBridgeToken: UncheckedSendable<NSObject>? = nil
    var lastPresentationValues: [ViewIdentity : ContextMenuPresentation] = [:]
    var presentationSeed: VersionSeed = .empty
    var presentedMenu: ActiveContextMenu = ActiveContextMenu()
}
