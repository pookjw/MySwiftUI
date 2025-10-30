package protocol OpacityAccessibilityProvider {
    
}

extension _GraphInputs {
    var opacityAccessibilityProvider: (any OpacityAccessibilityProvider.Type) {
        get {
            return unsafe self[OpacityAccessibilityProviderKey.self]
        }
        set {
            unsafe self[OpacityAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[OpacityAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct OpacityAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any OpacityAccessibilityProvider.Type) = EmptyOpacityAccessibilityProvider.self
    }
}

struct EmptyOpacityAccessibilityProvider: OpacityAccessibilityProvider {
    
}
