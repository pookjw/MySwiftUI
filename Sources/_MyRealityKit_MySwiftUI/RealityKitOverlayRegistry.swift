@_spi(Internal) public import MyRealityFoundation
internal import CoreRE
private import RealityKit

@objc final class __RealityKitOverlayRegistry : ExternalBuiltInComponentRegistry {
    override class func registerBuiltInComponents(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, MyRealityFoundation::ComponentInfo.Access, MyRealityFoundation::ComponentInfo.Availability) -> Void) {
        ARKitAnchorComponent.registerBuiltinComponent(block)
        __RealityKitOverlayRegistry.registerVisionOSComponents(block)
    }
    
    static func registerVisionOSComponents(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, MyRealityFoundation::ComponentInfo.Access, MyRealityFoundation::ComponentInfo.Availability) -> Void) {
        assertUnimplemented()
    }
}
