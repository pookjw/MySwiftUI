
package protocol TextAccessibilityProvider: View {
    
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
    
    fileprivate struct TextAccessibilityProviderKey: GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any TextAccessibilityProvider.Type) = EmptyTextAccessibilityProvider.self
    }
}

struct EmptyTextAccessibilityProvider: TextAccessibilityProvider {
    public var body: Never {
        fatalError("TODO")
    } // TODO
}
