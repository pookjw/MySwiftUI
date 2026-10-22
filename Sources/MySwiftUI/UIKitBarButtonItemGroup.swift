internal import UIKit
internal import MySwiftUICore
private import _MySwiftUICoreShims

class UIKitBarButtonItemGroup : UIBarButtonItemGroup {
    // TODO

    override class func _isFromMySwiftUI() -> Bool {
        assertUnimplemented()
    }

    override init(barButtonItems: [UIBarButtonItem], representativeItem: UIBarButtonItem?) {
        assertUnimplemented()
    }

    required init?(coder: NSCoder) {
        assertUnimplemented()
    }
}
