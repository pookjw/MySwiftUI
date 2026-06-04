public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
public struct PointLightComponent : Component, Equatable {
    public var __color: CGColor
    
    public var intensity: Float
    
    public var attenuationRadius: Float
    
    public init(cgColor: CGColor, intensity: Float = 26963.76, attenuationRadius: Float = 10.0) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> PointLightComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: PointLightComponent, b: PointLightComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension PointLightComponent {
    public var attenuationFalloffExponent: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension PointLightComponent : _ImplicitlyAnimatableBuiltinComponent {
}
