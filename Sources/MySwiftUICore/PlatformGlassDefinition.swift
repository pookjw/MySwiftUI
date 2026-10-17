@_spi(Internal)
open class PlatformGlassDefinition {
    nonisolated(unsafe) static var uiKit: PlatformGlassDefinition.Type?
    nonisolated(unsafe) static var appKit: PlatformGlassDefinition.Type?
    
    package static func setDefinition(_ definition: PlatformGlassDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .appKit:
            if unsafe PlatformGlassDefinition.appKit == nil {
                unsafe PlatformGlassDefinition.appKit = definition
            }
        case .uiKit:
            if unsafe PlatformGlassDefinition.uiKit == nil {
                unsafe PlatformGlassDefinition.uiKit = definition
            }
        default:
            break
        }
    } 
    
    // TODO
}
