// EBD1C829A869D5EC3C2FDA55F4467D9A
internal import CoreUI

struct CoreUIDefaultSystemColorDefinition : SystemColorDefinition {
    static func value(for type: SystemColorType, environment: EnvironmentValues) -> Color.ResolvedHDR {
        switch type {
        case .red:
            return CoreUIDefaultSystemColorDefinition.value(named: .red, in: environment)
        case .orange:
            return CoreUIDefaultSystemColorDefinition.value(named: .orange, in: environment)
        case .yellow:
            return CoreUIDefaultSystemColorDefinition.value(named: .yellow, in: environment)
        case .green:
            return CoreUIDefaultSystemColorDefinition.value(named: .green, in: environment)
        case .teal:
            return CoreUIDefaultSystemColorDefinition.value(named: .teal, in: environment)
        case .mint:
            return CoreUIDefaultSystemColorDefinition.value(named: .mint, in: environment)
        case .cyan:
            return CoreUIDefaultSystemColorDefinition.value(named: .cyan, in: environment)
        case .blue:
            return CoreUIDefaultSystemColorDefinition.value(named: .blue, in: environment)
        case .indigo:
            return CoreUIDefaultSystemColorDefinition.value(named: .indigo, in: environment)
        case .purple:
            return CoreUIDefaultSystemColorDefinition.value(named: .purple, in: environment)
        case .pink:
            return CoreUIDefaultSystemColorDefinition.value(named: .pink, in: environment)
        case .brown:
            return CoreUIDefaultSystemColorDefinition.value(named: .brown, in: environment)
        case .gray:
            return CoreUIDefaultSystemColorDefinition.value(named: .gray, in: environment)
        case .primary:
            return CoreUIDefaultSystemColorDefinition.value(named: .primary, in: environment)
        case .secondary:
            return CoreUIDefaultSystemColorDefinition.value(named: .secondary, in: environment)
        case .tertiary:
            return CoreUIDefaultSystemColorDefinition.value(named: .tertiary, in: environment)
        case .quaternary:
            return CoreUIDefaultSystemColorDefinition.value(named: .quaternary, in: environment)
        case .quinary:
            return CoreUIDefaultSystemColorDefinition.value(named: .quinary, in: environment)
        case .primaryFill:
            return DefaultSystemColorDefinition_Vision.value(for: .quaternary, environment: environment)
        case .secondaryFill:
            return DefaultSystemColorDefinition_Vision.value(for: .quinary, environment: environment)
        case .tertiaryFill:
            return DefaultSystemColorDefinition_Vision.value(for: .tertiaryFill, environment: environment)
        case .quaternaryFill:
            return DefaultSystemColorDefinition_Vision.value(for: .quaternaryFill, environment: environment)
        }
    }
    
    static func opacity(at: Int, environment: EnvironmentValues) -> Float {
        assertUnimplemented()
    }
    
    static func value(named: CUIColorName, in environment: EnvironmentValues) -> Color.ResolvedHDR {
        assertUnimplemented()
    }
}
