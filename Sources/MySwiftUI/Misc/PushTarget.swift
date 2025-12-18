internal import UIKit

struct PushTarget {
    private weak var navController: UINavigationController?
    private var shouldReplaceRoot: Bool
    private var column: UISplitViewController.Column?
}
