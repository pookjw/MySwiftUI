public import CoreGraphics

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, visionOS 2.0, *)
public struct DirectionalLightComponent : Component, Equatable {
    public struct Shadow : Component, Equatable {
        public var depthBias: Float
        
        @available(macOS, introduced: 10.15, deprecated: 15.0, message: "Use .shadowProjection = .automatic(maximumDistance:)")
        @available(iOS, introduced: 13.0, deprecated: 18.0, message: "Use .shadowProjection = .automatic(maximumDistance:)")
        @available(macCatalyst, introduced: 13.0, deprecated: 18.0, message: "Use .shadowProjection = .automatic(maximumDistance:)")
        @available(visionOS, unavailable, introduced: 2.0, message: "Use .shadowProjection = .automatic(maximumDistance:)")
        @available(tvOS, unavailable)
        public var maximumDistance: Float {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public init() {
            assertUnimplemented()
        }
        
        public init(maximumDistance: Float = 5.0, depthBias: Float = 1.0) {
            assertUnimplemented()
        }
        
        @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> DirectionalLightComponent.Shadow {
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
        
        public static func == (a: DirectionalLightComponent.Shadow, b: DirectionalLightComponent.Shadow) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var __color: CGColor
    
    public var intensity: Float
//    @available(visionOS, unavailable)
    
    public var isRealWorldProxy: Bool
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> DirectionalLightComponent {
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
    
    public static func == (a: DirectionalLightComponent, b: DirectionalLightComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension DirectionalLightComponent.Shadow {
    public typealias ShadowMapCullMode = MaterialParameterTypes.FaceCulling
    
    public var cullModeOverride: DirectionalLightComponent.Shadow.ShadowMapCullMode? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public enum ShadowProjectionType : Equatable {
        case fixed(zNear: Float = 0.01, zFar: Float = 10, orthographicScale: Float = 1)
        case automatic(maximumDistance: Float = 5)
        
        public static func == (a: DirectionalLightComponent.Shadow.ShadowProjectionType, b: DirectionalLightComponent.Shadow.ShadowProjectionType) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var shadowProjection: DirectionalLightComponent.Shadow.ShadowProjectionType {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(shadowProjection: DirectionalLightComponent.Shadow.ShadowProjectionType, depthBias: Float, cullMode: DirectionalLightComponent.Shadow.ShadowMapCullMode? = nil) {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension DirectionalLightComponent : _ImplicitlyAnimatableBuiltinComponent {
}
