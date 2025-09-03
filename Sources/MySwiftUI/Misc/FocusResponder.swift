#warning("TODO")
internal import UIKit
internal import MySwiftUICore

protocol BaseFocusResponder: AnyObject {
    var platformItem: UIFocusItem? { get }
    var viewItem: FocusItem.ViewItem? { get }
    var frame: CGRect? { get }
    var frameAsScrollViewContent: CGRect? { get }
    var isInVisibleRect: Bool { get }
    var isEnabled: Bool { get }
    var prefersDefaultFocus: Bool { get }
    var defaultFocusNamespace: Namespace.ID? { get }
//    var focusGroupID: FocusGroupIdentifier? { get }
    var focusGroupPriority: Int { get }
    var focusDebugDescription: String? { get }
}

protocol FocusResponder: BaseFocusResponder {
    var focusItem: FocusItem? { get }
//    var focusAccessibilityNode: AccessibilityNode? { get set _modify }
//    var keyPressHandlers: [KeyPress.Handler] { get set _modify }
}
