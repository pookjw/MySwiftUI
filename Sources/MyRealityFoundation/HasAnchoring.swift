public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasAnchoring : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasAnchoring {
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    @MainActor @preconcurrency public var anchoring: AnchoringComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, deprecated, message: "Anchoring with ARAnchor is not available on visionOS.")
    @MainActor @preconcurrency public var anchorIdentifier: UUID? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    @available(visionOS, deprecated, message: "reanchor(_:preservingWorldTransform:) is not supported on visionOS")
    @MainActor @preconcurrency public func reanchor(_ target: AnchoringComponent.Target, preservingWorldTransform: Bool = true) {
        assertUnimplemented()
    }
}
