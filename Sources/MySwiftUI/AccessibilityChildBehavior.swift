
struct AccessibilityChildBehavior {
    private var modifier: any AnyResolvableAccessibilityViewModifier
}

extension AccessibilityChildBehavior {
    struct Host : Hashable {
        func initialAttachment(for nodes: [AccessibilityNode]) -> AccessibilityAttachment {
            assertUnimplemented()
        }
    }
}

extension AccessibilityChildBehavior : Hashable {
    static func == (lhs: AccessibilityChildBehavior, rhs: AccessibilityChildBehavior) -> Bool {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}
