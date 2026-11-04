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
    
    public static func == (a: PointLightComponent, b: PointLightComponent) -> Bool {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

extension PointLightComponent {
    struct Shadow : Component, Equatable {
        init() {
            assertUnimplemented()
        }
        
        init(depthBias: Float) {
            assertUnimplemented()
        }
        
        enum ClippingPlane : Equatable {
            case automatic
            case fixed(Float)
            
            static func == (a: PointLightComponent.Shadow.ClippingPlane, b: PointLightComponent.Shadow.ClippingPlane) -> Bool {
                assertUnimplemented()
            }
        }
        
        var maximumDistance: Float {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        var depthBias: Float {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        var zNear: PointLightComponent.Shadow.ClippingPlane {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        var zFar: PointLightComponent.Shadow.ClippingPlane {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        var cullModeOverride: MaterialParameterTypes.FaceCulling? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @MainActor @preconcurrency static func __fromCore(_ coreComponent: __ComponentRef) -> PointLightComponent.Shadow {
            assertUnimplemented()
        }

        @MainActor @preconcurrency func __toCore(_ coreComponent: __ComponentRef) {
            assertUnimplemented()
        }

        static func == (a: PointLightComponent.Shadow, b: PointLightComponent.Shadow) -> Bool {
            assertUnimplemented()
        }

        static var componentName: String {
            get {
                assertUnimplemented()
            }
        }

        static func __load(from ref: UnsafeRawPointer) {
            assertUnimplemented()
        }

        static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
            assertUnimplemented()
        }

        static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
            assertUnimplemented()
        }

        static var __coreComponentType: __ComponentTypeRef {
            get {
                assertUnimplemented()
            }
        }

        static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
            assertUnimplemented()
        }

        static var coreComponentType: CoreComponentType {
            assertUnimplemented()
        }
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
    
    public init(cgColor: CGColor, intensity: Float, attenuationRadius: Float, attenuationFalloffExponent: Float) {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension PointLightComponent : _ImplicitlyAnimatableBuiltinComponent {
    @_spi(Internal) public static func animation(from: PointLightComponent, to: PointLightComponent) -> (from: ComponentAnimatableData<PointLightComponent>, to: ComponentAnimatableData<PointLightComponent>) {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension PointLightComponent : DefaultInitializable {
    init() {
        assertUnimplemented()
    }
}

extension PointLightComponent : CustomReflectable {
    public var customMirror: Mirror {
        assertUnimplemented()
    }
}

extension PointLightComponent.Shadow : CustomReflectable {
    public var customMirror: Mirror {
        assertUnimplemented()
    }
}

extension PointLightComponent.Shadow : DefaultInitializable {
}

