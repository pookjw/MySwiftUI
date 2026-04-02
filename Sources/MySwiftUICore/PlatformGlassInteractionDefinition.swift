@_spi(Internal)
open class PlatformGlassInteractionDefinition {
    @safe nonisolated(unsafe) package static var uiKit: PlatformGlassInteractionDefinition.Type?
    @safe nonisolated(unsafe) package static var appKit: PlatformGlassInteractionDefinition.Type?
    
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
