// E9056C24F23374CCD1A34D90898CB830
internal import AttributeGraph

struct TextAllowsSelection : ViewInput {
    static var defaultValue: Bool {
        return false
    }
}

struct TextSelectionForbidden : ViewInputBoolFlag {
    init() {}
}

protocol PlatformTextSelectionRepresentation {
    static func makeSelectableText(resolvedText: Attribute<ResolvedStyledText>, view: Attribute<Text>, inputs: _ViewInputs, isScrapeable: Bool) -> _ViewOutputs
}

extension _ViewInputs {
    var textSelectionRepresentation: (any PlatformTextSelectionRepresentation.Type)? {
        get {
            return self.base.textSelectionRepresentation
        }
        set {
            self.base.textSelectionRepresentation = newValue
        }
    }
}

extension _GraphInputs {
    var textSelectionRepresentation: (any PlatformTextSelectionRepresentation.Type)? {
        get {
            return self[_GraphInputs.TextSelectionRepresentationKey.self]
        }
        set {
            self[_GraphInputs.TextSelectionRepresentationKey.self] = newValue
        }
    }
    
    fileprivate struct TextSelectionRepresentationKey : GraphInput {
        static var defaultValue: (any PlatformTextSelectionRepresentation.Type)? {
            return nil
        }
    }
}
