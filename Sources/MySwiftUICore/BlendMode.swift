internal import CoreGraphics

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

extension BlendMode {
    init(_ blendMode: CGBlendMode) {
        switch blendMode {
        case .normal:
            self = .normal
        case .multiply:
            self = .multiply
        case .screen:
            self = .screen
        case .overlay:
            self = .overlay
        case .darken:
            self = .darken
        case .lighten:
            self = .lighten
        case .colorDodge:
            self = .colorDodge
        case .colorBurn:
            self = .colorBurn
        case .softLight:
            self = .softLight
        case .hardLight:
            self = .hardLight
        case .difference:
            self = .difference
        case .exclusion:
            self = .exclusion
        case .hue:
            self = .hue
        case .saturation:
            self = .saturation
        case .color:
            self = .color
        case .luminosity:
            self = .luminosity
        case .sourceAtop:
            self = .sourceAtop
        case .destinationOver:
            self = .destinationOver
        case .destinationOut:
            self = .destinationOut
        case .plusDarker:
            self = .plusDarker
        case .plusLighter:
            self = .plusLighter
        default:
            self = .normal
        }
    }
}

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
