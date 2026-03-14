public import Foundation

@_spi(Internal)
open class PlatformColorDefinition {
    open class var system: PlatformSystemDefinition {
        fatalError() // abstact
    }
    
    open class var deserializationType: (NSObject & NSSecureCoding).Type {
        fatalError() // abstact
    }
    
    open class func resolvedColor(_ color: AnyObject, environment: EnvironmentValues) -> Color.Resolved? {
        fatalError() // abstact
    }
    
    open class func resolvedHDRColor(_ color: AnyObject, environment: EnvironmentValues) -> Color.ResolvedHDR? {
        fatalError() // abstact
    }
    
    package static func `for`(system: PlatformSystemDefinition) -> PlatformColorDefinition.Type? {
        fatalError("TODO")
    }
    
    package static func `for`(_ type: AnyObject.Type) -> PlatformColorDefinition? {
        fatalError("TODO")
    }
    
    @safe package static nonisolated(unsafe) var uiKit: PlatformColorDefinition.Type?
    @safe package static nonisolated(unsafe) var uiKitInternal: PlatformColorDefinition.Type?
    @safe package static nonisolated(unsafe) var appKit: PlatformColorDefinition.Type?
    @safe package static nonisolated(unsafe) var appKitInternal: PlatformColorDefinition.Type?
    
    package static func setDefinition(_ type: PlatformColorDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            PlatformColorDefinition.uiKit = type
        case .appKit:
            PlatformColorDefinition.appKit = type
        default:
            break
        }
    }
    
    package static func setInternalDefinition(_ type: PlatformColorDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            PlatformColorDefinition.uiKitInternal = type
        case .appKit:
            PlatformColorDefinition.appKitInternal = type
        default:
            break
        }
    }
}
