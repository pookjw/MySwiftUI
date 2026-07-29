@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct CharacterControllerStateComponent : Component {
    public init() {
        assertUnimplemented()
    }
    
    public let velocity: SIMD3<Float>
    
    public let isOnGround: Bool
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension CharacterControllerStateComponent {
    
    public static func __fromCore(_ coreComponent: __ComponentRef) -> CharacterControllerStateComponent {
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

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}
