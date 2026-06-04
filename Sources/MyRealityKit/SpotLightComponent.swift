public import UIKit

@available(visionOS 2.0, macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SpotLightComponent {
    public typealias Color = UIColor
    
    public var color: SpotLightComponent.Color {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(color: SpotLightComponent.Color = .white, intensity: Float = 6740.94, innerAngleInDegrees: Float = 45.0, outerAngleInDegrees: Float = 60.0, attenuationRadius: Float = 10.0) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension SpotLightComponent {
    public init(color: SpotLightComponent.Color = .white, intensity: Float = 6740.94, innerAngleInDegrees: Float = 45.0, outerAngleInDegrees: Float = 60.0, attenuationRadius: Float = 10.0, attenuationFalloffExponent: Float = 2.0) {
        assertUnimplemented()
    }
}
