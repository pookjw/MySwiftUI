package protocol AllowsHitTestingAccessibilityProvider {
    
}

extension _GraphInputs {
    var allowsHitTestingAccessibilityProvider: (any AllowsHitTestingAccessibilityProvider.Type) {
        get {
            return self[AllowsHitTestingAccessibilityProviderKey.self]
        }
        set {
            self[AllowsHitTestingAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[AllowsHitTestingAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct AllowsHitTestingAccessibilityProviderKey: GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any AllowsHitTestingAccessibilityProvider.Type) = EmptyAllowsHitTestingAccessibilityProvider.self
    }
}

struct EmptyAllowsHitTestingAccessibilityProvider: AllowsHitTestingAccessibilityProvider {
    
}
