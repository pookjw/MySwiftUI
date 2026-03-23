// F613AABF2A2A0496B46514894D5116C3
internal import MySwiftUICore

extension _ViewInputs {
    var requestedViewThatFitsRepresentation: (any PlatformViewThatFitsRepresentable.Type)? {
        get {
            return self[_GraphInputs.ViewThatFitsRepresentationKey.self]
        }
        set {
            self[_GraphInputs.ViewThatFitsRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    var requestedViewThatFitsRepresentation: (any PlatformViewThatFitsRepresentable.Type)? {
        get {
            return self[_GraphInputs.ViewThatFitsRepresentationKey.self]
        }
        set {
            self[_GraphInputs.ViewThatFitsRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    fileprivate struct ViewThatFitsRepresentationKey: ViewInput {
        static var defaultValue: (any PlatformViewThatFitsRepresentable.Type)? {
            return nil
        }
    }
}

protocol PlatformViewThatFitsRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func makeRepresentation(inputs: _ViewInputs, state: SizeFittingState, outputs: inout _ViewOutputs)
}

final class SizeFittingState {
    // TODO
}
