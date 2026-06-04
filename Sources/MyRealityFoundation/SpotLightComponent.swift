public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
public struct SpotLightComponent : Component, Equatable {
    public struct Shadow : Component, Equatable {
        public init() {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> SpotLightComponent.Shadow {
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
        
        public static func == (a: SpotLightComponent.Shadow, b: SpotLightComponent.Shadow) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var __color: CGColor
    
    public var intensity: Float
    
    public var innerAngleInDegrees: Float
    
    public var outerAngleInDegrees: Float
    
    public var attenuationRadius: Float
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> SpotLightComponent {
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
    
    public static func == (a: SpotLightComponent, b: SpotLightComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension SpotLightComponent {
    public var attenuationFalloffExponent: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension SpotLightComponent.Shadow {
    public typealias ShadowMapCullMode = MaterialParameterTypes.FaceCulling
    
    public var depthBias: Float {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var cullModeOverride: SpotLightComponent.Shadow.ShadowMapCullMode? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public enum ShadowClippingPlane : Equatable {
        case automatic
        case fixed(Float)
        
        public static func == (a: SpotLightComponent.Shadow.ShadowClippingPlane, b: SpotLightComponent.Shadow.ShadowClippingPlane) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var zNear: SpotLightComponent.Shadow.ShadowClippingPlane {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var zFar: SpotLightComponent.Shadow.ShadowClippingPlane {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension SpotLightComponent : _ImplicitlyAnimatableBuiltinComponent {
}
