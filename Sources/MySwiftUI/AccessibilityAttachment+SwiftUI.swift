internal import MySwiftUICore
internal import AttributeGraph

extension AccessibilityAttachment {
    struct Key : @unsafe PreferenceKey {
        @safe nonisolated(unsafe) static let defaultValue = AccessibilityAttachment.Tree.empty
        
        static func reduce(value: inout AccessibilityAttachment.Tree, nextValue: () -> AccessibilityAttachment.Tree) {
            assertUnimplemented()
        }
    }
    
    struct DeferredTransform : Rule {
        @OptionalAttribute var tree: AccessibilityAttachment.Tree?
        @Attribute private(set) var attachment: AccessibilityAttachment
        
        var value: AccessibilityAttachment.Tree {
            assertUnimplemented()
        }
    }
    
    enum Tree {
        case leaf(AccessibilityAttachment)
        indirect case branch([AccessibilityAttachment.Tree])
        case empty
    }
}
