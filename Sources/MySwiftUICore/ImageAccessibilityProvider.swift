
package protocol ImageAccessibilityProvider {
    
}

extension _GraphInputs {
    var imageAccessibilityProvider: (any ImageAccessibilityProvider.Type) {
        get {
            return self[ImageAccessibilityProviderKey.self]
        }
        set {
            self[ImageAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[ImageAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct ImageAccessibilityProviderKey: GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any ImageAccessibilityProvider.Type) = EmptyImageAccessibilityProvider.self
    }
}

struct EmptyImageAccessibilityProvider: ImageAccessibilityProvider {
    
}
