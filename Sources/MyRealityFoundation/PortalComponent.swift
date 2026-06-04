@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct PortalComponent : Component {
    public var targetEntity: Entity? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public struct ClippingPlane {
        public var position: SIMD3<Float>
        
        public var normal: SIMD3<Float>
        
        public init(position: SIMD3<Float>, normal: SIMD3<Float>) {
            assertUnimplemented()
        }
    }
    
    public var clippingPlane: PortalComponent.ClippingPlane? {
        get {
            assertUnimplemented()
        }
        set(newPlane) {
            assertUnimplemented()
        }
    }
    
    public init(target: Entity, clippingPlane: PortalComponent.ClippingPlane? = nil) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension PortalComponent {
    public struct Plane : Equatable {
        public var position: SIMD3<Float>
        
        public var normal: SIMD3<Float>
        
        public init(position: SIMD3<Float>, normal: SIMD3<Float>) {
            assertUnimplemented()
        }
        
        public static func == (a: PortalComponent.Plane, b: PortalComponent.Plane) -> Bool {
            assertUnimplemented()
        }
    }
    
    public enum ClippingMode : Equatable {
        case disabled
        case plane(PortalComponent.Plane)
        
        public static func == (a: PortalComponent.ClippingMode, b: PortalComponent.ClippingMode) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var clippingMode: PortalComponent.ClippingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public enum CrossingMode : Equatable {
        case disabled
        case plane(PortalComponent.Plane)
        
        public static func == (a: PortalComponent.CrossingMode, b: PortalComponent.CrossingMode) -> Bool {
            assertUnimplemented()
        }
    }
    
    public var crossingMode: PortalComponent.CrossingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(target: Entity, clippingMode: PortalComponent.ClippingMode, crossingMode: PortalComponent.CrossingMode) {
        assertUnimplemented()
    }
    
    public struct Options : OptionSet {
        public init(rawValue: UInt) {
            assertUnimplemented()
        }
        
        public let rawValue: UInt
        
        @safe public static nonisolated(unsafe) let clipContents: PortalComponent.Options = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let allowCrossing: PortalComponent.Options = {
            assertUnimplemented()
        }()
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias ArrayLiteralElement = PortalComponent.Options
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = PortalComponent.Options
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias RawValue = UInt
    }
    
    public init(target: Entity, plane: PortalComponent.Plane, options: PortalComponent.Options) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension PortalComponent.Plane {
    @safe public static nonisolated(unsafe) let positiveX: PortalComponent.Plane = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let negativeX: PortalComponent.Plane = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let positiveY: PortalComponent.Plane = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let negativeY: PortalComponent.Plane = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let positiveZ: PortalComponent.Plane = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let negativeZ: PortalComponent.Plane = {
        assertUnimplemented()
    }()
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension PortalComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> PortalComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}
