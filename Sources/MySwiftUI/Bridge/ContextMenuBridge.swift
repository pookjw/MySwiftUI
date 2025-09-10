#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class ContextMenuBridge: NSObject {
    private weak var host: (any ViewRendererHost)? = nil
    private var interaction: UIContextMenuInteraction? = nil
    private var menuOrder: MenuOrder = .automatic
    private var hasContextMenuSeed: VersionSeed = .empty
    private var menuOrderSeed: VersionSeed = .empty
    private var inspectorBridgeToken: UncheckedSendable<NSObject>? = nil
    private var lastPresentationValues: [ViewIdentity : ContextMenuPresentation] = [:]
    private var presentationSeed: VersionSeed = .empty
    private var presentedMenu: ActiveContextMenu = ActiveContextMenu()
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    final func setUp(host: (any ViewRendererHost)) {
        self.host = host
    }
}
