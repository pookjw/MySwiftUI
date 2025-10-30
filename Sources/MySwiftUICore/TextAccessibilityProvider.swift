#warning("TODO")

package protocol TextAccessibilityProvider: View {
    
}

extension _GraphInputs {
    var textAccessibilityProvider: (any TextAccessibilityProvider.Type) {
        get {
            return unsafe self[TextAccessibilityProviderKey.self]
        }
        set {
            unsafe self[TextAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[TextAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct TextAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any TextAccessibilityProvider.Type) = EmptyTextAccessibilityProvider.self
    }
}

struct EmptyTextAccessibilityProvider: TextAccessibilityProvider {
    public var body: Never {
        fatalError("TODO")
    } // TODO
}
