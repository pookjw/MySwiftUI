#warning("TODO")
public import Foundation

@safe fileprivate nonisolated(unsafe) var uiKitType: PlatformColorDefinition.Type?
@safe fileprivate nonisolated(unsafe) var appKitType: PlatformColorDefinition.Type?

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
    
    @safe package static nonisolated(unsafe) var uiKit: PlatformColorDefinition?
    @safe package static nonisolated(unsafe) var uiKitInternal: PlatformColorDefinition?
    @safe package static nonisolated(unsafe) var appKit: PlatformColorDefinition?
    @safe package static nonisolated(unsafe) var appKitInternal: PlatformColorDefinition?
    
    package static func setDefinition(_ type: PlatformColorDefinition.Type, system: PlatformSystemDefinition) {
        fatalError("TODO")
    }
    
    package static func setInternalDefinition(_ type: PlatformColorDefinition.Type, system: PlatformSystemDefinition) {
        switch system {
        case .uiKit:
            uiKitType = type
        case .appKit:
            appKitType = type
        default:
            break
        }
    }
}
