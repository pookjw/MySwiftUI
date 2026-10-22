public import Foundation

@_spi(Internal)
open class PlatformColorDefinition {
    open class var system : PlatformSystemDefinition {
        fatalError() // abstact
    }
    
    open class var deserializationType : (NSObject & NSSecureCoding).Type {
        fatalError() // abstact
    }
    
    open class func resolvedColor(_ color : AnyObject, environment: EnvironmentValues) -> Color.Resolved? {
        fatalError() // abstact
    }
    
    open class func resolvedHDRColor(_ color : AnyObject, environment: EnvironmentValues) -> Color.ResolvedHDR? {
        return resolvedColor(color, environment: environment).map { Color.ResolvedHDR($0) }
    }
    
    package static func `for`(system: PlatformSystemDefinition) -> PlatformColorDefinition.Type? {
        assertUnimplemented()
    }
    
    package static func `for`(_ type: AnyObject.Type) -> PlatformColorDefinition? {
        assertUnimplemented()
    }
    
    @safe nonisolated(unsafe) package static var uiKit: PlatformColorDefinition.Type?
    @safe nonisolated(unsafe) package static var uiKitInternal: PlatformColorDefinition.Type?
    @safe nonisolated(unsafe) package static var appKit: PlatformColorDefinition.Type?
    @safe nonisolated(unsafe) package static var appKitInternal: PlatformColorDefinition.Type?
    
    deinit {
        assertUnimplemented()
    }

    package static func setDefinition(_ type: PlatformColorDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            if PlatformColorDefinition.uiKit == nil {
                PlatformColorDefinition.uiKit = type
            }
        case .appKit:
            if PlatformColorDefinition.appKit == nil {
                PlatformColorDefinition.appKit = type
            }
        default:
            break
        }
    }
    
    package static func setInternalDefinition(_ type: PlatformColorDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            if PlatformColorDefinition.uiKitInternal == nil {
                PlatformColorDefinition.uiKitInternal = type
            }
        case .appKit:
            if PlatformColorDefinition.appKitInternal == nil {
                PlatformColorDefinition.appKitInternal = type
            }
        default:
            break
        }
    }
}
