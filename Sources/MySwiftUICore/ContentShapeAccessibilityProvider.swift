package protocol ContentShapeAccessibilityProvider {
    
}

extension _GraphInputs {
    var contentShapeAccessibilityProvider: (any ContentShapeAccessibilityProvider.Type) {
        get {
            return unsafe self[ContentShapeAccessibilityProviderKey.self]
        }
        set {
            unsafe self[ContentShapeAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield unsafe &self[ContentShapeAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct ContentShapeAccessibilityProviderKey: @unsafe GraphInput {
        static nonisolated(unsafe) let defaultValue: (any ContentShapeAccessibilityProvider.Type) = EmptyContentShapeAccessibilityProvider.self
    }
}

struct EmptyContentShapeAccessibilityProvider: ContentShapeAccessibilityProvider {
    
}
