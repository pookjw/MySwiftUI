package protocol HiddenAccessibilityProvider {
    static func removeAccessibilityKeys(inputs: inout _ViewInputs)
}

extension _GraphInputs {
    var hiddenAccessibilityProvider: (any HiddenAccessibilityProvider.Type)? {
        get {
            return self[HiddenAccessibilityProviderKey.self]
        }
        set {
            self[HiddenAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[HiddenAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct HiddenAccessibilityProviderKey : GraphInput {
        static var defaultValue: (any HiddenAccessibilityProvider.Type)? {
            return nil
        }
    }
}

struct EmptyHiddenAccessibilityProvider : HiddenAccessibilityProvider {
    static func removeAccessibilityKeys(inputs: inout _ViewInputs) {
        assertUnimplemented()
    }
}
