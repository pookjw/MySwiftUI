@_spi(Internal)
open class PlatformGlassDefinition {
    static nonisolated(unsafe) var uiKit: PlatformGlassDefinition.Type?
    static nonisolated(unsafe) var appKit: PlatformGlassDefinition.Type?
    
    package static func setDefinition(_ definition: PlatformGlassDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .appKit:
            unsafe PlatformGlassDefinition.appKit = definition
        case .uiKit:
            unsafe PlatformGlassDefinition.uiKit = definition
        default:
            break
        }
    } 
    
    // TODO
}
