package protocol OpacityAccessibilityProvider {
    
}

extension _GraphInputs {
    var opacityAccessibilityProvider: (any OpacityAccessibilityProvider.Type) {
        get {
            return self[OpacityAccessibilityProviderKey.self]
        }
        set {
            self[OpacityAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[OpacityAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct OpacityAccessibilityProviderKey: GraphInput {
        static let defaultValue: (any OpacityAccessibilityProvider.Type) = EmptyOpacityAccessibilityProvider.self
    }
}

struct EmptyOpacityAccessibilityProvider: OpacityAccessibilityProvider {
    
}
