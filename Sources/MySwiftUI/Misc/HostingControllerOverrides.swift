internal import UIKit

struct HostingControllerOverrides {
    private(set) var pushTarget: PushTarget?
    private(set) weak var navigation: UINavigationController?
    private(set) weak var split: UISplitViewController?
    private(set) var hasBackItem: Bool?
}
