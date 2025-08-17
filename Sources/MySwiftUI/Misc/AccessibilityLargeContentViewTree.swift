#warning("TODO")

enum AccessibilityLargeContentViewTree {
    case leaf(AccessibilityLargeContentViewItem)
    case branch([AccessibilityLargeContentViewTree])
    case empty
}

struct AccessibilityLargeContentViewItem {
    
}
