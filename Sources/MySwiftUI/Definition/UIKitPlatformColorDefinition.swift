@_spi(Internal) internal import MySwiftUICore

final class UIKitPlatformColorDefinition: PlatformColorDefinition {
    override class var system: PlatformSystemDefinition {
        return .uiKit
    }
    
    override class func resolvedColor(_ color: AnyObject, environment: EnvironmentValues) -> Color.Resolved? {
        fatalError("TODO")
    }
}
