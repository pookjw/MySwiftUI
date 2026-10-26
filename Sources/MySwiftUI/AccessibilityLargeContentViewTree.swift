@_spi(Internal) internal import MySwiftUICore
internal import CoreGraphics

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

extension AccessibilityLargeContentViewTree {
    nonisolated func hitTest(at point: CGPoint) -> AccessibilityLargeContentViewItem? {
        assertUnimplemented()
    }
    
    nonisolated var hasValue: Bool {
        assertUnimplemented()
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
