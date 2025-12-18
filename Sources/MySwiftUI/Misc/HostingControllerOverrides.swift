private import UIKit

struct HostingControllerOverrides {
    private var pushTarget: PushTarget?
    private weak var navigation: UINavigationController?
    private weak var split: UISplitViewController?
    private var hasBackItem: Bool?
}
