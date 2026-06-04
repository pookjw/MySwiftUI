public import UIKit

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
public protocol EntityGestureRecognizer : UIGestureRecognizer {
    var entity: (any HasCollision)? { get set }
    
    @preconcurrency @MainActor func location(in entity: Entity?) -> SIMD3<Float>?
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable)
extension EntityGestureRecognizer {
    public func location(in entity: Entity?) -> SIMD3<Float>? {
        assertUnimplemented()
    }
}
