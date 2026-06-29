public enum BlendMode : Sendable {
    case normal
    case multiply
    case screen
    case overlay
    case darken
    case lighten
    case colorDodge
    case colorBurn
    case softLight
    case hardLight
    case difference
    case exclusion
    case hue
    case saturation
    case color
    case luminosity
    case sourceAtop
    case destinationOver
    case destinationOut
    case plusDarker
    case plusLighter
}

extension BlendMode : Equatable {}
extension BlendMode : Hashable {}

struct AllowsVibrantBlendingKey : EnvironmentKey {
    static var defaultValue: Bool? {
        return nil
    }
}

extension EnvironmentValues {
    var allowsVibrantBlending: Bool {
        get {
            return self[AllowsVibrantBlendingKey.self] ?? true
        }
        set {
            self[AllowsVibrantBlendingKey.self] = newValue
        }
    }
}
