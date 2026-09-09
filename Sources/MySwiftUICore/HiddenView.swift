// EEBDF553DE8212BCBDF456E235E95E1E
private import AttributeGraph

extension _ViewInputs {
    package var requestedHiddenRepresentation: (any PlatformHiddenRepresentable.Type)? {
        get {
            return self[_GraphInputs.PlatformHiddenRepresentationKey.self]
        }
        set {
            self[_GraphInputs.PlatformHiddenRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    package var requestedHiddenRepresentation: (any PlatformHiddenRepresentable.Type)? {
        get {
            return self[_GraphInputs.PlatformHiddenRepresentationKey.self]
        }
        set {
            self[_GraphInputs.PlatformHiddenRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    fileprivate struct PlatformHiddenRepresentationKey : ViewInput {
        static var defaultValue: (any PlatformHiddenRepresentable.Type)? {
            return nil
        }
    }
}

package protocol PlatformHiddenRepresentable {
    static func makeRepresentation(inputs: inout _ViewInputs, allowedKeys: AllowedPreferenceKeysWhileHidden)
}

package struct AllowedPreferenceKeysWhileHidden : OptionSet {
    package static var accessibility: AllowedPreferenceKeysWhileHidden {
        return AllowedPreferenceKeysWhileHidden(rawValue: 1 << 0)
    }
    
    package static var platformItemList: AllowedPreferenceKeysWhileHidden {
        return AllowedPreferenceKeysWhileHidden(rawValue: 1 << 1)
    }
    
    package static var viewResponders: AllowedPreferenceKeysWhileHidden {
        return AllowedPreferenceKeysWhileHidden(rawValue: 1 << 2)
    }
    
    package static var hostPreference: AllowedPreferenceKeysWhileHidden {
        return AllowedPreferenceKeysWhileHidden(rawValue: 1 << 3)
    }
    
    package static var displayList: AllowedPreferenceKeysWhileHidden {
        return AllowedPreferenceKeysWhileHidden(rawValue: 1 << 4)
    }
    
    package let rawValue: Int
    
    package init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

package func makeHiddenView(
    allowedKeys: AllowedPreferenceKeysWhileHidden = [],
    inputs: _ViewInputs,
    body: (_Graph, _ViewInputs) -> _ViewOutputs
) -> _ViewOutputs {
    /*
     allowedKeys -> x0 -> x25 -> sp + 0x10
     inputs -> x1
     body -> x2/x3 -> x19/x22
     */
    // x20 -> sp + 0x70
    // sp + 0xd0 (x20 + 0x60)
    let copy_1 = inputs
    // sp + 0x70
    var copy_2 = inputs
    // sp + 0x18
    let _ = copy_1
    
    // <+148>
    copy_2.preferences.keys.removeHiddenKeys(allowing: allowedKeys)
    
    struct HostKeys : Rule {
        @Attribute private(set) var hostKeys: PreferenceKeys
        let allowedKeys: AllowedPreferenceKeysWhileHidden
        
        var value: PreferenceKeys {
            assertUnimplemented()
        }
    }
    
    let keys = HostKeys(
        hostKeys: copy_2.preferences.hostKeys,
        allowedKeys: allowedKeys
    )
    // sp + 0xa8
    copy_2.preferences.hostKeys = Attribute(keys)
    
    // <+232>
    if let rep = copy_1.requestedHiddenRepresentation {
        rep.makeRepresentation(inputs: &copy_2, allowedKeys: allowedKeys)
    }
    
    // <+284>
    if
        !allowedKeys.contains(.accessibility),
        let key = copy_1.hiddenAccessibilityProvider
    {
        key.removeAccessibilityKeys(inputs: &copy_2)
    }
    
    return body(_Graph(), copy_2)
}

extension PreferenceKeys {
    fileprivate func removeHiddenKeys(allowing: AllowedPreferenceKeysWhileHidden) {
        // allowing -> x0 -> w21
        assertUnimplemented()
    }
}
