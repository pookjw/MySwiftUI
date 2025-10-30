package protocol CustomHoverEffectAccessibilityProvider {
    
}

extension _GraphInputs {
    var customHoverEffectAccessibilityProvider: (any CustomHoverEffectAccessibilityProvider.Type) {
        get {
            return unsafe self[CustomHoverEffectAccessibilityProviderKey.self]
        }
        set {
            unsafe self[CustomHoverEffectAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[CustomHoverEffectAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct CustomHoverEffectAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any CustomHoverEffectAccessibilityProvider.Type) = EmptyCustomHoverEffectAccessibilityProvider.self
    }
}

struct EmptyCustomHoverEffectAccessibilityProvider: CustomHoverEffectAccessibilityProvider {
    
}
