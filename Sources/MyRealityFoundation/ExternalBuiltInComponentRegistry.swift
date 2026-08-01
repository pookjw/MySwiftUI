public import Foundation
public import CoreRE

@_spi(Internal) open class ExternalBuiltInComponentRegistry : NSObject {
    open class func registerBuiltInComponents(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, ComponentInfo.Access, ComponentInfo.Availability) -> Void) {
        // nop
    }
}
