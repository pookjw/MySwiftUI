package protocol LayoutAccessibilityProvider {
    
}

extension _GraphInputs {
    var layoutAccessibilityProvider: (any LayoutAccessibilityProvider.Type) {
        get {
            return unsafe self[LayoutAccessibilityProviderKey.self]
        }
        set {
            unsafe self[LayoutAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[LayoutAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct LayoutAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any LayoutAccessibilityProvider.Type) = EmptyLayoutAccessibilityProvider.self
    }
}

struct EmptyLayoutAccessibilityProvider: LayoutAccessibilityProvider {
    
}
