package protocol CustomHoverEffectAccessibilityProvider {
    
}

extension _GraphInputs {
    var customHoverEffectAccessibilityProvider: (any CustomHoverEffectAccessibilityProvider.Type) {
        get {
            return self[CustomHoverEffectAccessibilityProviderKey.self]
        }
        set {
            self[CustomHoverEffectAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[CustomHoverEffectAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct CustomHoverEffectAccessibilityProviderKey: GraphInput {
        static nonisolated(unsafe) let defaultValue: (any CustomHoverEffectAccessibilityProvider.Type) = EmptyCustomHoverEffectAccessibilityProvider.self
    }
}

struct EmptyCustomHoverEffectAccessibilityProvider: CustomHoverEffectAccessibilityProvider {
    
}
