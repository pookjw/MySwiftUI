package import AttributeGraph

package protocol OpacityAccessibilityProvider {
    static func makeOpacity(
        effect: @autoclosure () -> Attribute<_OpacityEffect>,
        inputs: _ViewInputs,
        outputs: inout _ViewOutputs
    )
}

extension _GraphInputs {
    var opacityAccessibilityProvider: (any OpacityAccessibilityProvider.Type) {
        get {
            return self[OpacityAccessibilityProviderKey.self]
        }
        set {
            self[OpacityAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[OpacityAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct OpacityAccessibilityProviderKey : GraphInput {
        @safe nonisolated(unsafe) static let defaultValue: (any OpacityAccessibilityProvider.Type) = EmptyOpacityAccessibilityProvider.self
    }
}

struct EmptyOpacityAccessibilityProvider : OpacityAccessibilityProvider {
    static func makeOpacity(effect: @autoclosure () -> Attribute<_OpacityEffect>, inputs: _ViewInputs, outputs: inout _ViewOutputs) {
        assertUnimplemented()
    }
}
