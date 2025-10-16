package protocol LayoutAccessibilityProvider {
    
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
    
    fileprivate struct LayoutAccessibilityProviderKey: GraphInput {
        static nonisolated(unsafe) let defaultValue: (any LayoutAccessibilityProvider.Type) = EmptyLayoutAccessibilityProvider.self
    }
}

struct EmptyLayoutAccessibilityProvider: LayoutAccessibilityProvider {
    
}
