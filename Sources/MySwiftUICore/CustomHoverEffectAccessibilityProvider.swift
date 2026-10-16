package import AttributeGraph

package protocol CustomHoverEffectAccessibilityProvider {
    static func makeAccessibility(identity: _DisplayList_Identity, inputs: _CustomHoverEffectInputs, outputs: inout _CustomHoverEffectOutputs, effectList: () -> Attribute<CustomHoverEffectList>)
}

extension _GraphInputs {
    var customHoverEffectAccessibilityProvider: (any CustomHoverEffectAccessibilityProvider.Type) {
        get {
            return self[CustomHoverEffectAccessibilityProviderKey.self]
        }
        set {
            self[CustomHoverEffectAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[CustomHoverEffectAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct CustomHoverEffectAccessibilityProviderKey : GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any CustomHoverEffectAccessibilityProvider.Type) = EmptyCustomHoverEffectAccessibilityProvider.self
    }
}

struct EmptyCustomHoverEffectAccessibilityProvider : CustomHoverEffectAccessibilityProvider {
    static func makeAccessibility(identity: _DisplayList_Identity, inputs: _CustomHoverEffectInputs, outputs: inout _CustomHoverEffectOutputs, effectList: () -> Attribute<CustomHoverEffectList>) {
        assertUnimplemented()
    }
}

package struct CustomHoverEffectList {
}
