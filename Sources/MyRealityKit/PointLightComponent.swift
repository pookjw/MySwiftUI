public import UIKit

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, visionOS 2.0, tvOS 26.0, *)
extension PointLightComponent {
    public typealias Color = UIColor
    
    public var color: PointLightComponent.Color {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(color: PointLightComponent.Color = .white, intensity: Float = 26963.76, attenuationRadius: Float = 10.0) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension PointLightComponent {
    public init(color: PointLightComponent.Color = .white, intensity: Float = 26963.76, attenuationRadius: Float = 10.0, attenuationFalloffExponent: Float = 2.0) {
        assertUnimplemented()
    }
}
