// A41482AADD0929733C3343B5E142E952
internal import MySwiftUICore

extension _ViewInputs {
    var requestedDividerRepresentation: (any PlatformDividerRepresentable.Type)? {
        get {
            return self[_GraphInputs.DividerRepresentationKey.self]
        }
        set {
            self[_GraphInputs.DividerRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    var requestedDividerRepresentation: (any PlatformDividerRepresentable.Type)? {
        get {
            return self[_GraphInputs.DividerRepresentationKey.self]
        }
        set {
            self[_GraphInputs.DividerRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    fileprivate struct DividerRepresentationKey: ViewInput {
        static var defaultValue: (any PlatformDividerRepresentable.Type)? {
            return nil
        }
    }
}

protocol PlatformDividerRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func makeRepresentation(inputs: _ViewInputs, outputs: inout _ViewOutputs)
}
