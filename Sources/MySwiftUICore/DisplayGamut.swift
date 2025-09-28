package enum DisplayGamut: Int, Hashable/*, ProtobufEnum, CodableByProxy, Serializable*/ {
    case sGRB
    case displayP3
    
    static var deviceDefault: DisplayGamut {
        // _CUIDefaultDisplayGamut
        fatalError("TODO")
    }
}

extension EnvironmentValues {
    package var displayGamut: DisplayGamut {
        get {
            return self[DisplayGamutKey.self]
        }
        set {
            self[DisplayGamutKey.self] = newValue
        }
    }
}

fileprivate struct DisplayGamutKey: EnvironmentKey {
    static var defaultValue: DisplayGamut {
        return .sGRB
    }
}
