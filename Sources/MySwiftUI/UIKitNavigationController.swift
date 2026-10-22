internal import UIKit
internal import MySwiftUICore
private import _UIKitPrivate
private import _MySwiftUICoreShims

class UIKitNavigationController : UINavigationController {
    // TODO

    override class func _isFromMySwiftUI() -> Bool {
        assertUnimplemented()
    }

    override init(rootViewController: UIViewController) {
        assertUnimplemented()
    }

    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        assertUnimplemented()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override func _canShowWhileLocked() -> Bool {
        assertUnimplemented()
    }

    override func _supportsDataDrivenNavigation() -> Bool {
        assertUnimplemented()
    }

    override func viewDidAppear(_ animated: Bool) {
        assertUnimplemented()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        assertUnimplemented()
    }

    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        assertUnimplemented()
    }

    override func viewWillLayoutSubviews() {
        assertUnimplemented()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        assertUnimplemented()
    }
}
