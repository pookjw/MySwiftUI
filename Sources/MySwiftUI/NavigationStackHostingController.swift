internal import MySwiftUICore
internal import UIKit
private import _UIKitPrivate

final class NavigationStackHostingController<Content : View>: UIHostingController<Content> {
    // TODO

    override init(rootView: Content) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }

    override func _canShowWhileLocked() -> Bool {
        assertUnimplemented()
    }

    override func viewDidLoad() {
        assertUnimplemented()
    }
}
