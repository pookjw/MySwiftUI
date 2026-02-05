internal import UIKit

struct PushTarget {
    private(set) weak var navController: UINavigationController?
    private(set) var shouldReplaceRoot: Bool
    private(set) var column: UISplitViewController.Column?
}
