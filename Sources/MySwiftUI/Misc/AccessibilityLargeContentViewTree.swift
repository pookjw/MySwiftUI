#warning("TODO")
internal import MySwiftUICore

enum AccessibilityLargeContentViewTree {
    case leaf(AccessibilityLargeContentViewItem)
    case branch([AccessibilityLargeContentViewTree])
    case empty
}

extension AccessibilityLargeContentViewTree {
    struct Key: HostPreferenceKey {
        static let defaultValue = AccessibilityLargeContentViewTree.empty
    }
}

struct AccessibilityLargeContentViewItem {
    
}
