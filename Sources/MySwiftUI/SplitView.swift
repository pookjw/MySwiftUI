internal import MySwiftUICore
internal import UIKit

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
}

class NotifyingMulticolumnSplitViewController : UISplitViewController {
    // TODO
}
