public import ARKit
@_spi(Internal) package import MyRealityFoundation
package import CoreRE
private import RealityFusion

@available(visionOS 26.0, iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
public struct ARKitAnchorComponent : TransientComponent {
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ARKitAnchorComponent {
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
        assertUnimplemented()
    }
    
    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }
    
    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
    
    package static func registerBuiltinComponent(_ block: (any MyRealityFoundation::Component.Type, CoreRE::Component.ClassPtr?, CoreRE::ComponentType?, ComponentInfo.Access, ComponentInfo.Availability) -> Void) {
        let availability = ComponentInfo.Availability(
            introduced: [
                .iOS("26.0"),
                .visionOS("26.0")
            ],
            deprecated: nil,
            obsoleted: nil
        )
        
        block(
            ARKitAnchorComponent.self,
            RFGetAnchorSourceComponentType(),
            nil,
            .api,
            availability
        )
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
