@_spi(Internal)
open class PlatformGlassInteractionDefinition {
    @safe nonisolated(unsafe) package static var uiKit: PlatformGlassInteractionDefinition.Type?
    @safe nonisolated(unsafe) package static var appKit: PlatformGlassInteractionDefinition.Type?
    
    open class var system: PlatformSystemDefinition {
        fatalError() // abstract
    }
    
    open class var interactionType: CoreInteractionRepresentable.Type? {
        fatalError() // abstract
    }
    
    package static func `for`(system: PlatformSystemDefinition) -> PlatformGlassInteractionDefinition.Type? {
        assertUnimplemented()
    }
    
    package static func setDefinition(_ type: PlatformGlassInteractionDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            if PlatformGlassInteractionDefinition.uiKit == nil {
                PlatformGlassInteractionDefinition.uiKit = type
            }
        case .appKit:
            if PlatformGlassInteractionDefinition.appKit == nil {
                PlatformGlassInteractionDefinition.appKit = type
            }
        default:
            break
        }
    }
}
