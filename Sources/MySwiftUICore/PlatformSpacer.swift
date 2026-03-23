// 81D5572A9475F8358655E25B09BAFBA9
package import AttributeGraph

extension _ViewInputs {
    package var requestedSpacerRepresentation: (any PlatformSpacerRepresentable.Type)? {
        get {
            return self[_GraphInputs.SpacerRepresentationKey.self]
        }
        set {
            self[_GraphInputs.SpacerRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    package var requestedSpacerRepresentation: (any PlatformSpacerRepresentable.Type)? {
        get {
            return self[_GraphInputs.SpacerRepresentationKey.self]
        }
        set {
            self[_GraphInputs.SpacerRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    fileprivate struct SpacerRepresentationKey: ViewInput {
        static var defaultValue: (any PlatformSpacerRepresentable.Type)? {
            return nil
        }
    }
}

package protocol PlatformSpacerRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func makeRepresentation(inputs: _ViewInputs, outputs: inout _ViewOutputs)
}
