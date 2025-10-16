package protocol ContentShapeAccessibilityProvider {
    
}

extension _GraphInputs {
    var contentShapeAccessibilityProvider: (any ContentShapeAccessibilityProvider.Type) {
        get {
            return self[ContentShapeAccessibilityProviderKey.self]
        }
        set {
            self[ContentShapeAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[ContentShapeAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct ContentShapeAccessibilityProviderKey: GraphInput {
        static nonisolated(unsafe) let defaultValue: (any ContentShapeAccessibilityProvider.Type) = EmptyContentShapeAccessibilityProvider.self
    }
}

struct EmptyContentShapeAccessibilityProvider: ContentShapeAccessibilityProvider {
    
}
