public import Foundation
public import CoreRE

@_spi(Internal) open class ExternalBuiltInComponentRegistry : NSObject {
    open class func registerBuiltInComponents(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, MyRealityFoundation::ComponentInfo.Access, MyRealityFoundation::ComponentInfo.Availability) -> Void) {
        // nop
    }
}
