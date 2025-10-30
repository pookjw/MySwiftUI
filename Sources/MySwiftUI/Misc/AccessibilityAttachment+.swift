internal import MySwiftUICore

extension AccessibilityAttachment {
    struct Key: @unsafe PreferenceKey {
        static nonisolated(unsafe) let defaultValue = AccessibilityAttachment.Tree.empty
        
        static func reduce(value: inout AccessibilityAttachment.Tree, nextValue: () -> AccessibilityAttachment.Tree) {
            fatalError("TODO")
        }
    }
    
    enum Tree {
        case leaf(AccessibilityAttachment)
        indirect case branch([AccessibilityAttachment.Tree])
        case empty
    }
}
