@_spi(Internal) internal import MySwiftUICore
internal import Foundation

class UICorePlatformColorDefinition : PlatformColorDefinition {
    override class var system : PlatformSystemDefinition {
        assertUnimplemented()
    }
    
    override class var deserializationType: (NSObject & NSSecureCoding).Type {
        assertUnimplemented()
    }
    
    override class func resolvedColor(_ color : AnyObject, environment: EnvironmentValues) -> Color.Resolved? {
        assertUnimplemented()
    }
}
