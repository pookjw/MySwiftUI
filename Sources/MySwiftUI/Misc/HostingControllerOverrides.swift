internal import UIKit

struct HostingControllerOverrides {
    private(set) var pushTarget: PushTarget? // 0x0
    private(set) weak var navigation: UINavigationController? // 0x20
    private(set) weak var split: UISplitViewController? // 0x28
    private(set) var hasBackItem: Bool? // 0x30
}
