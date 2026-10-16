package protocol AllowsHitTestingAccessibilityProvider {
    static func makeView(modifier: _GraphValue<_AllowsHitTestingModifier>, inputs: _ViewInputs, outputs: inout _ViewOutputs)
}

extension _GraphInputs {
    var allowsHitTestingAccessibilityProvider: (any AllowsHitTestingAccessibilityProvider.Type) {
        get {
            return self[AllowsHitTestingAccessibilityProviderKey.self]
        }
        set {
            self[AllowsHitTestingAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[AllowsHitTestingAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct AllowsHitTestingAccessibilityProviderKey : GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any AllowsHitTestingAccessibilityProvider.Type) = EmptyAllowsHitTestingAccessibilityProvider.self
    }
}

struct EmptyAllowsHitTestingAccessibilityProvider : AllowsHitTestingAccessibilityProvider {
    static func makeView(modifier: _GraphValue<_AllowsHitTestingModifier>, inputs: _ViewInputs, outputs: inout _ViewOutputs) {
        assertUnimplemented()
    }
}

public struct _AllowsHitTestingModifier {
    // TODO
}
