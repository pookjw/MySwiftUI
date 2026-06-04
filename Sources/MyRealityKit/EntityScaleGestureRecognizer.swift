public import Foundation
public import UIKit

@objc @_inheritsConvenienceInitializers @available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable)
@MainActor @preconcurrency open class EntityScaleGestureRecognizer : UIPinchGestureRecognizer, EntityGestureRecognizer {
    @MainActor @preconcurrency public var entity: (any HasCollision)? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency @objc override dynamic open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func canPrevent(_ preventedGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic public init(target: Any?, action: Selector?) {
        assertUnimplemented()
    }
    }
