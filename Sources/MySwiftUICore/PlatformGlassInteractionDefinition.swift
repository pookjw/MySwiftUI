@_spi(Internal)
open class PlatformGlassInteractionDefinition {
    @safe package static nonisolated(unsafe) var uiKit: PlatformGlassInteractionDefinition.Type?
    @safe package static nonisolated(unsafe) var appKit: PlatformGlassInteractionDefinition.Type?
    
    package static func setDefinition(_ type: PlatformGlassInteractionDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            PlatformGlassInteractionDefinition.uiKit = type
        case .appKit:
            PlatformGlassInteractionDefinition.appKit = type
        default:
            break
        }
    }
}
