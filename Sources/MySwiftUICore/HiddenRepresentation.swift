package import AttributeGraph

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
    fileprivate struct PlatformHiddenRepresentationKey: ViewInput {
        static var defaultValue: (any PlatformHiddenRepresentable.Type)? {
            return nil
        }
    }
}

package protocol PlatformHiddenRepresentable {
    static func makeRepresentation(inputs: inout _ViewInputs, allowedKeys: AllowedPreferenceKeysWhileHidden)
}

package struct AllowedPreferenceKeysWhileHidden {
    let rawValue: Int
}
