package protocol GestureAccessibilityProvider {
    
}

extension _GraphInputs {
    var gestureAccessibilityProvider: (any GestureAccessibilityProvider.Type) {
        get {
            return self[GestureAccessibilityProviderKey.self]
        }
        set {
            self[GestureAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[GestureAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct GestureAccessibilityProviderKey: GraphInput {
        static let defaultValue: (any GestureAccessibilityProvider.Type) = EmptyGestureAccessibilityProvider.self
    }
}

fileprivate struct EmptyGestureAccessibilityProvider: GestureAccessibilityProvider {
    
}
