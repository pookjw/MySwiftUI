public import ARKit
@_spi(Internal) package import MyRealityFoundation

@available(visionOS 26.0, iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
public struct ARKitAnchorComponent : TransientComponent {

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
        assertUnimplemented()
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation.Component {
        assertUnimplemented()
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
extension ARKitAnchorComponent {
    public var anchor: any Anchor {
        get {
            assertUnimplemented()
        }
    }
}
