// 9E3352CE4697DF56A738786E16992848
internal import CoreGraphics
private import _MySwiftUIShims

enum SystemColorType : CodableSerializable, Hashable, ColorProvider, Codable {
    case red
    case orange
    case yellow
    case green
    case teal
    case mint
    case cyan
    case blue
    case indigo
    case purple
    case pink
    case brown
    case gray
    case primary
    case secondary
    case tertiary
    case quaternary
    case quinary
    case primaryFill
    case secondaryFill
    case tertiaryFill
    case quaternaryFill
    
    var tag: Color.ProviderTag {
        assertUnimplemented()
    }
    
    func resolve(in environment: EnvironmentValues) -> Color.Resolved {
        assertUnimplemented()
    }
    
    func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
        return environment.systemColorDefinition.value(for: self, environment: environment)
    }
    
    func apply(color: Color, to: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
    
    var staticColor: CGColor? {
        return nil
    }
    
    var kitColor: AnyObject? {
        switch self {
        case .red:
            return CoreColor.systemRedColor(with: .uiKit)
        case .orange:
            return CoreColor.systemOrangeColor(with: .uiKit)
        case .yellow:
            return CoreColor.systemYellowColor(with: .uiKit)
        case .green:
            return CoreColor.systemGreenColor(with: .uiKit)
        case .teal:
            return CoreColor.systemTealColor(with: .uiKit)
        case .mint:
            return CoreColor.systemMintColor(with: .uiKit)
        case .cyan:
            return CoreColor.systemCyanColor(with: .uiKit)
        case .blue:
            return CoreColor.systemBlueColor(with: .uiKit)
        case .indigo:
            return CoreColor.systemIndigoColor(with: .uiKit)
        case .purple:
            return CoreColor.systemPurpleColor(with: .uiKit)
        case .pink:
            return CoreColor.systemPinkColor(with: .uiKit)
        case .brown:
            return CoreColor.systemBrownColor(with: .uiKit)
        case .gray:
            return CoreColor.systemGrayColor(with: .uiKit)
        case .primary:
            return nil
        case .secondary:
            return nil
        case .tertiary:
            return nil
        case .quaternary:
            return nil
        case .quinary:
            return nil
        case .primaryFill:
            return nil
        case .secondaryFill:
            return nil
        case .tertiaryFill:
            return nil
        case .quaternaryFill:
            return nil
        }
    }
    
    var colorDescription: String {
        assertUnimplemented()
    }
    
    func opacity(at: Int, environment: EnvironmentValues) -> Float {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    func serialize(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    static func deserialize(from decoder: Decoder) throws -> SystemColorType {
        assertUnimplemented()
    }
    
    // TODO: CodingKeys
}

protocol SystemColorDefinition {
    static func value(for type: SystemColorType, environment: EnvironmentValues) -> Color.ResolvedHDR
    static func opacity(at: Int, environment: EnvironmentValues) -> Float
}

extension EnvironmentValues {
    @inline(always) // 원래 없음
    var systemColorDefinition: (any SystemColorDefinition.Type) {
        get {
            return self[SystemColorDefinitionKey.self]
        }
        set {
            self[SystemColorDefinitionKey.self] = newValue
        }
    }
}

fileprivate struct SystemColorDefinitionKey : EnvironmentKey {
    static var defaultValue: (any SystemColorDefinition.Type) {
        return CoreUIDefaultSystemColorDefinition.self
    }
}

struct DefaultSystemColorDefinition_Vision {
    static func value(for type: SystemColorType, environment: EnvironmentValues) -> Color.ResolvedHDR {
        assertUnimplemented()
    }
}
