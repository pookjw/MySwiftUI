// F24B13C37D4990A93C622BFF14CD564A
internal import AttributeGraph

protocol TextAlwaysOnProvider {
    static func makeAlwaysOn(inputs: _ViewInputs, schedule: @autoclosure () -> Attribute<(any TimelineSchedule)?>, outputs: inout _ViewOutputs)
}

extension _ViewInputs {
    var textAlwaysOnProvider: (any TextAlwaysOnProvider.Type)? {
        get {
            return self.base.textAlwaysOnProvider
        }
        set {
            self.base.textAlwaysOnProvider = newValue
        }
    }
}

extension _GraphInputs {
    var textAlwaysOnProvider: (any TextAlwaysOnProvider.Type)? {
        get {
            return self[_GraphInputs.TextAlwaysOnProviderKey.self]
        }
        set {
            self[_GraphInputs.TextAlwaysOnProviderKey.self] = newValue
        }
    }
    
    fileprivate struct TextAlwaysOnProviderKey : GraphInput {
        static var defaultValue: (any TextAlwaysOnProvider.Type)? {
            return nil
        }
    }
}
