public import UIKit

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, visionOS 2.0, tvOS 26.0, *)
extension DirectionalLightComponent {
    public typealias Color = UIColor
    
    public var color: DirectionalLightComponent.Color {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, *)
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public init(color: DirectionalLightComponent.Color = .white, intensity: Float = 2145.7078) {
        assertUnimplemented()
    }
    
    @available(visionOS, unavailable, introduced: 2.0)
    public init(color: DirectionalLightComponent.Color = .white, intensity: Float = 2145.7078, isRealWorldProxy: Bool = false) {
        assertUnimplemented()
    }
}
