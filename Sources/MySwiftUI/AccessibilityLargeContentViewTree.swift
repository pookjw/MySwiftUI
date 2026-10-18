@_spi(Internal) internal import MySwiftUICore

enum AccessibilityLargeContentViewTree {
    case leaf(AccessibilityLargeContentViewItem)
    case branch([AccessibilityLargeContentViewTree])
    case empty
}

extension AccessibilityLargeContentViewTree {
    struct Key : HostPreferenceKey {
        static let defaultValue = AccessibilityLargeContentViewTree.empty
        
        static func reduce(value: inout AccessibilityLargeContentViewTree, nextValue: () -> AccessibilityLargeContentViewTree) {
            assertUnimplemented()
        }
    }
}

struct AccessibilityLargeContentViewItem {
    
}

extension AccessibilityLargeContentViewTree : Equatable {
    static func == (lhs: AccessibilityLargeContentViewTree, rhs: AccessibilityLargeContentViewTree) -> Bool {
        assertUnimplemented()
    }
}

extension AccessibilityLargeContentViewItem : Equatable {
    static func == (lhs: AccessibilityLargeContentViewItem, rhs: AccessibilityLargeContentViewItem) -> Bool {
        assertUnimplemented()
    }
}
