internal import MySwiftUICore
internal import UIKit
private import _MySwiftUICoreShims

extension EnvironmentValues {
    var isInExpandedSplitView: Bool {
        get {
            return self[ExpandedSplitViewKey.self]
        }
        set {
            self[ExpandedSplitViewKey.self] = newValue
        }
    }
}

struct ExpandedSplitViewKey : EnvironmentKey {
    static let defaultValue = !isLinkedOnOrAfter(.v4)
}

class NotificationSendingSplitViewController : UISplitViewController {
    // TODO
    
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        assertUnimplemented()
    }
}

class NotifyingMulticolumnSplitViewController : UISplitViewController {
    // TODO
    
    override class func _isFromMySwiftUI() -> Bool {
        assertUnimplemented()
    }
    
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        assertUnimplemented()
    }
    
    override var childForStatusBarHidden: UIViewController? {
        assertUnimplemented()
    }
}

struct UISplitViewControllerProxy {
    // TODO
}

class UISplitViewControllerProxyStorage {
    // TODO
}
