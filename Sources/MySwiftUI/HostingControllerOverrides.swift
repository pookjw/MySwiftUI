internal import UIKit

struct HostingControllerOverrides {
    private(set) var pushTarget: PushTarget? // 0x0
    private(set) weak var navigation: UINavigationController? // 0x20
    private(set) weak var split: UISplitViewController? // 0x28
    private(set) var hasBackItem: Bool? // 0x30
}

extension HostingControllerOverrides : Equatable, CustomDebugStringConvertible {
    static func == (lhs: HostingControllerOverrides, rhs: HostingControllerOverrides) -> Bool {
        return (lhs.pushTarget == rhs.pushTarget) &&
        (lhs.navigation === rhs.navigation) &&
        (lhs.split === rhs.split) &&
        (lhs.hasBackItem == rhs.hasBackItem)
    }
    
    var debugDescription: String {
        assertUnimplemented()
    }
}
