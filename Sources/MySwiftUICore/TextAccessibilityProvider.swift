
package protocol TextAccessibilityProvider : View {
    
}

extension _GraphInputs {
    var textAccessibilityProvider: (any TextAccessibilityProvider.Type) {
        get {
            return self[TextAccessibilityProviderKey.self]
        }
        set {
            self[TextAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[TextAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct TextAccessibilityProviderKey : GraphInput {
        static let defaultValue: (any TextAccessibilityProvider.Type) = EmptyTextAccessibilityProvider.self
    }
}

struct EmptyTextAccessibilityProvider : TextAccessibilityProvider {
    static func makeView(content: StyledTextContentView, text: Text, resolved: ResolvedStyledText) -> StyledTextContentView {
        assertUnimplemented()
    }

    public var body: Never {
        assertUnimplemented()
    } // TODO
}
