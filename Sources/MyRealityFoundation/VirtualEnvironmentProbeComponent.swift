@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct VirtualEnvironmentProbeComponent : Component {
    public enum Source {
        case none
        case single(VirtualEnvironmentProbeComponent.Probe)
        case blend(from: VirtualEnvironmentProbeComponent.Probe, to: VirtualEnvironmentProbeComponent.Probe, t: Float)
    }
    
    public struct Probe {
        public var environment: EnvironmentResource
        
        public var intensityExponent: Float
        
        public init(environment: EnvironmentResource, intensityExponent: Float = 0) {
            assertUnimplemented()
        }
    }
    
    public var source: VirtualEnvironmentProbeComponent.Source
    
    public init(source: VirtualEnvironmentProbeComponent.Source = .none) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> VirtualEnvironmentProbeComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
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
