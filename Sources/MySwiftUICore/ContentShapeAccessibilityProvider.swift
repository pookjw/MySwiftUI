package import AttributeGraph

package protocol ContentShapeAccessibilityProvider {
    static func makeAccessibility(kind: @autoclosure () -> AttributeGraph.Attribute<ContentShapeKinds>?, inputs: _ViewInputs, outputs: inout _ViewOutputs)
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
    
    fileprivate struct ContentShapeAccessibilityProviderKey : GraphInput {
        static let defaultValue: (any ContentShapeAccessibilityProvider.Type) = EmptyContentShapeAccessibilityProvider.self
    }
}

struct EmptyContentShapeAccessibilityProvider : ContentShapeAccessibilityProvider {
    static func makeAccessibility(kind: @autoclosure () -> AttributeGraph.Attribute<ContentShapeKinds>?, inputs: _ViewInputs, outputs: inout _ViewOutputs) {
    }
}
