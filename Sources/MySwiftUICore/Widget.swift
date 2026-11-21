// FD72118870A434CF0E2B5B97BD09B3FE

extension _ViewInputs {
    var hasWidgetMetadata: Bool {
        get {
            return self.base.hasWidgetMetadata
        }
        set {
            self.base.hasWidgetMetadata = newValue
        }
    }
}

extension _GraphInputs {
    var hasWidgetMetadata: Bool {
        get {
            return self[_GraphInputs.HasWidgetMetadataKey.self]
        }
        set {
            self[_GraphInputs.HasWidgetMetadataKey.self] = newValue
        }
    }
    
    fileprivate struct HasWidgetMetadataKey : GraphInput {
        static var defaultValue: Bool {
            return false
        }
    }
}
