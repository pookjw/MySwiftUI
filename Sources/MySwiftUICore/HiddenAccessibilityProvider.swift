package protocol HiddenAccessibilityProvider {
    
}

extension _GraphInputs {
    var hiddenAccessibilityProvider: (any HiddenAccessibilityProvider.Type) {
        get {
            return unsafe self[HiddenAccessibilityProviderKey.self]
        }
        set {
            unsafe self[HiddenAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[HiddenAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct HiddenAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any HiddenAccessibilityProvider.Type) = EmptyHiddenAccessibilityProvider.self
    }
}

struct EmptyHiddenAccessibilityProvider: HiddenAccessibilityProvider {
    
}
