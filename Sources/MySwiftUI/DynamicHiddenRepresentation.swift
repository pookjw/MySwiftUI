// 8D63435B81E83062F98F8C50416D392F
internal import MySwiftUICore
internal import AttributeGraph

extension _ViewInputs {
    var requestedDynamicHiddenRepresentation: (any PlatformDynamicHiddenRepresentable.Type)? {
        get {
            return self[_GraphInputs.DynamicHiddenRepresentationKey.self]
        }
        set {
            self[_GraphInputs.DynamicHiddenRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    var requestedDynamicHiddenRepresentation: (any PlatformDynamicHiddenRepresentable.Type)? {
        get {
            return self[_GraphInputs.DynamicHiddenRepresentationKey.self]
        }
        set {
            self[_GraphInputs.DynamicHiddenRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    fileprivate struct DynamicHiddenRepresentationKey: ViewInput {
        static var defaultValue: (any PlatformDynamicHiddenRepresentable.Type)? {
            return nil
        }
    }
}

protocol PlatformDynamicHiddenRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func makeRepresentation(inputs: _ViewInputs, modifier: Attribute<DynamicHiddenModifier>, outputs: inout _ViewOutputs)
}

struct DynamicHiddenModifier {
    // TODO
}
