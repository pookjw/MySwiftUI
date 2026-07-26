@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ImageBasedLightReceiverComponent : Component, Equatable {
    public var imageBasedLight: Entity
    
    public init(imageBasedLight: Entity) {
        assertUnimplemented()
    }
    
    public static func == (a: ImageBasedLightReceiverComponent, b: ImageBasedLightReceiverComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ImageBasedLightReceiverComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> ImageBasedLightReceiverComponent {
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
