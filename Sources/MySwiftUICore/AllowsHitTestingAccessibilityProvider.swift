package protocol AllowsHitTestingAccessibilityProvider {
    
}

extension _GraphInputs {
    var allowsHitTestingAccessibilityProvider: (any AllowsHitTestingAccessibilityProvider.Type) {
        get {
            return unsafe self[AllowsHitTestingAccessibilityProviderKey.self]
        }
        set {
            unsafe self[AllowsHitTestingAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[AllowsHitTestingAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct AllowsHitTestingAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any AllowsHitTestingAccessibilityProvider.Type) = EmptyAllowsHitTestingAccessibilityProvider.self
    }
}

struct EmptyAllowsHitTestingAccessibilityProvider: AllowsHitTestingAccessibilityProvider {
    
}
