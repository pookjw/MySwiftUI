public import ARKit

@available(visionOS 26.0, iOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(tvOS, unavailable)
public struct ARKitAnchorComponent : TransientComponent {
    package static var __coreComponentType: __ComponentTypeRef {
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
