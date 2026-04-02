@_spi(Internal)
open class PlatformGlassDefinition {
    nonisolated(unsafe) static var uiKit: PlatformGlassDefinition.Type?
    nonisolated(unsafe) static var appKit: PlatformGlassDefinition.Type?
    
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
