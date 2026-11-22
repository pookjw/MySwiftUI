package protocol TextAccessibilityProvider {
    associatedtype Body : View
    static func makeView(content: StyledTextContentView, text: Text, resolved: ResolvedStyledText) -> Self.Body
}

extension _ViewInputs {
    package var textAccessibilityProvider: (any TextAccessibilityProvider.Type) {
        get {
            return base.textAccessibilityProvider
        }
        set {
            base.textAccessibilityProvider = newValue
        }
        _modify {
            yield &base.textAccessibilityProvider
        }
    }
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
        @safe static nonisolated(unsafe) let defaultValue: (any TextAccessibilityProvider.Type) = EmptyTextAccessibilityProvider.self
    }
}

struct EmptyTextAccessibilityProvider : TextAccessibilityProvider {
    static func makeView(content: StyledTextContentView, text: Text, resolved: ResolvedStyledText) -> StyledTextContentView {
        assertUnimplemented()
    }
}
