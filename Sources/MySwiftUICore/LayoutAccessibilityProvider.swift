package protocol LayoutAccessibilityProvider {
    static func makeAccessibility(inputs: _ViewInputs, outputs: inout _ViewOutputs)
}

extension _GraphInputs {
    var layoutAccessibilityProvider: (any LayoutAccessibilityProvider.Type) {
        get {
            return self[LayoutAccessibilityProviderKey.self]
        }
        set {
            self[LayoutAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[LayoutAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct LayoutAccessibilityProviderKey : GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any LayoutAccessibilityProvider.Type) = EmptyLayoutAccessibilityProvider.self
    }
}

struct EmptyLayoutAccessibilityProvider : LayoutAccessibilityProvider {
    static func makeAccessibility(inputs: _ViewInputs, outputs: inout _ViewOutputs) {
        // noop
    }
}
