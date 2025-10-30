#warning("TODO")

package protocol ImageAccessibilityProvider {
    
}

extension _GraphInputs {
    var imageAccessibilityProvider: (any ImageAccessibilityProvider.Type) {
        get {
            return unsafe self[ImageAccessibilityProviderKey.self]
        }
        set {
            unsafe self[ImageAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[ImageAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct ImageAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any ImageAccessibilityProvider.Type) = EmptyImageAccessibilityProvider.self
    }
}

struct EmptyImageAccessibilityProvider: ImageAccessibilityProvider {
    
}
