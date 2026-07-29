@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, tvOS 26.0, *)
public struct AttachedTransformComponent : Component {
    public init(source: GeometricPin? = nil, target: GeometricPin) {
        assertUnimplemented()
    }
    
    public var target: GeometricPin
    
    public var source: GeometricPin?
}

@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, tvOS 26.0, *)
extension AttachedTransformComponent {
    @preconcurrency @MainActor public static func __fromCore(_ coreComponent: __ComponentRef) -> AttachedTransformComponent {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func __toCore(_ coreComponent: __ComponentRef) {
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
