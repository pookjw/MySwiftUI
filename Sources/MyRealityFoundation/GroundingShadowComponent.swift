@available(visionOS 1.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct GroundingShadowComponent : Component {
    public var castsShadow: Bool
    
    public init(castsShadow: Bool) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension GroundingShadowComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> GroundingShadowComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
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

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation.Component {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension GroundingShadowComponent {
    public var receivesShadow: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(castsShadow: Bool, receivesShadow: Bool) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension GroundingShadowComponent {
    public enum FadeBehaviorNearPhysicalObjects {
        case `default`
        case fade
        case constant
        
        public static func == (a: GroundingShadowComponent.FadeBehaviorNearPhysicalObjects, b: GroundingShadowComponent.FadeBehaviorNearPhysicalObjects) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var fadeBehaviorNearPhysicalObjects: GroundingShadowComponent.FadeBehaviorNearPhysicalObjects {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(castsShadow: Bool, receivesShadow: Bool, fadeBehaviorNearPhysicalObjects: GroundingShadowComponent.FadeBehaviorNearPhysicalObjects) {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension GroundingShadowComponent.FadeBehaviorNearPhysicalObjects : Equatable {}

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
extension GroundingShadowComponent.FadeBehaviorNearPhysicalObjects : Hashable {}
