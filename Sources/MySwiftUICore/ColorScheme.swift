public enum ColorScheme : CaseIterable, Sendable {
    case light
    case dark
}

extension ColorScheme : Equatable {}
extension ColorScheme : Hashable {}

extension EnvironmentValues {
    package var systemColorScheme: ColorScheme {
        get {
            return self[SystemColorSchemeKey.self]
        }
        set {
            self[SystemColorSchemeKey.self] = newValue
        }
        _modify {
            yield &self[SystemColorSchemeKey.self]
        }
    }
    
    package var explicitPreferredColorScheme: ColorScheme? {
        get {
            return self[ExplicitPreferredColorSchemeKey.self]
        }
        set {
            self[ExplicitPreferredColorSchemeKey.self] = newValue 
        }
        _modify {
            yield &self[ExplicitPreferredColorSchemeKey.self]
        }
    }
    
    package var glassColorScheme: ColorScheme? {
        get {
            return self[ExplicitColorSchemeKey.self]
        }
        set {
            self[ExplicitColorSchemeKey.self] = newValue
        }
    }
    
    public var colorScheme: ColorScheme {
        get {
            return self[ExplicitColorSchemeKey.self] ?? self[PlatformColorSchemeKey.self]
        }
        set {
            guard newValue != colorScheme else {
                return
            }
            self[ExplicitColorSchemeKey.self] = newValue
        }
    }
    
    public var colorSchemeContrast: ColorSchemeContrast {
        return self[ColorSchemeContrastKey.self]
    }
    
    public var _colorSchemeContrast: ColorSchemeContrast {
        get {
            return colorSchemeContrast
        }
        set {
            self[ColorSchemeContrastKey.self] = newValue
        }
        _modify {
            yield &self[ColorSchemeContrastKey.self]
        }
    }
    
    package var defaultColorScheme: ColorScheme {
        get {
            return self[PlatformColorSchemeKey.self]
        }
        set {
            self[PlatformColorSchemeKey.self] = newValue
        }
    }
}

public enum ColorSchemeContrast : CaseIterable, Sendable {
    case standard
    case increased
}

fileprivate struct ColorSchemeContrastKey : EnvironmentKey {
    static var defaultValue: ColorSchemeContrast {
        return .standard
    }
}

fileprivate struct SystemColorSchemeKey : EnvironmentKey {
    static var defaultValue: ColorScheme {
        return .light
    }
}

fileprivate struct ExplicitPreferredColorSchemeKey : EnvironmentKey {
    static var defaultValue: ColorScheme? {
        return nil
    }
}

fileprivate struct ExplicitColorSchemeKey : EnvironmentKey {
    static var defaultValue: ColorScheme? {
        return nil
    }
}

fileprivate struct PlatformColorSchemeKey : EnvironmentKey {
    static var defaultValue: ColorScheme {
        return .light
    }
}

extension ColorScheme : ProtobufEnum {
    package var protobufValue: UInt {
        assertUnimplemented()
    }

    package init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}

extension ColorSchemeContrast : ProtobufEnum {
    package var protobufValue: UInt {
        assertUnimplemented()
    }

    package init?(protobufValue: UInt) {
        assertUnimplemented()
    }
}
