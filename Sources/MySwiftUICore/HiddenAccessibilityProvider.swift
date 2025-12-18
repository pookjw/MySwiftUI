package protocol HiddenAccessibilityProvider {
    
}

extension _GraphInputs {
    var hiddenAccessibilityProvider: (any HiddenAccessibilityProvider.Type) {
        get {
            return self[HiddenAccessibilityProviderKey.self]
        }
        set {
            self[HiddenAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[HiddenAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct HiddenAccessibilityProviderKey: GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any HiddenAccessibilityProvider.Type) = EmptyHiddenAccessibilityProvider.self
    }
}

struct EmptyHiddenAccessibilityProvider: HiddenAccessibilityProvider {
    
}
