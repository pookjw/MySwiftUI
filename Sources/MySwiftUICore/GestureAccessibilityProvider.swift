package protocol GestureAccessibilityProvider {
    
}

extension _GraphInputs {
    var gestureAccessibilityProvider: (any GestureAccessibilityProvider.Type) {
        get {
            return unsafe self[GestureAccessibilityProviderKey.self]
        }
        set {
            unsafe self[GestureAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[GestureAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct GestureAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any GestureAccessibilityProvider.Type) = EmptyGestureAccessibilityProvider.self
    }
}

fileprivate struct EmptyGestureAccessibilityProvider: GestureAccessibilityProvider {
    
}
