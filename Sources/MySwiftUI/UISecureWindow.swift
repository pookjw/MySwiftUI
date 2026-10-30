internal import UIKit
internal import MySwiftUICore

final class UISecureWindow : UIWindow {
    // TODO

    override init(windowScene: UIWindowScene) {
        assertUnimplemented()
    }

    override init(frame: CGRect) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    @objc static func _isSecure() -> Bool {
        assertUnimplemented()
    }
}
