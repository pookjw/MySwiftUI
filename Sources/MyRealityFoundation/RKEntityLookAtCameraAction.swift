public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityLookAtCameraAction : __RKEntityAction {
    @preconcurrency @MainActor convenience public init(targetEntity: Entity?, duration: Float = 1.0, direction: SIMD3<Float> = SIMD3<Float>(0, 1, 0), upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0)) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public init(targetEntity: Entity?, duration: Float = 1.0, animationDuration: Float = 0.0, direction: SIMD3<Float> = SIMD3<Float>(0, 1, 0), rotation: Float = 0, upVector: SIMD3<Float> = SIMD3<Float>(0, 1, 0), loops: Bool = false) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    }
