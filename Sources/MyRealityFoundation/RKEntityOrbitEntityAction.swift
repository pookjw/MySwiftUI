public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityOrbitEntityAction : __RKEntityAction {
    @preconcurrency @MainActor public init(targetEntity: Entity?, pivotEntity: Entity?, duration: Float = 1.0, rotations: Float = 1.0, orbitalAxis: SIMD3<Float> = SIMD3<Float>(0, 1, 0), orientToPath: Bool = false, spinDirection: __RKEntitySpinDirectionType = .clockwise, respectPhysics: Bool = false, physicsAngularCoefficient: Float = 0, physicsLinearCoefficient: Float = 0, loop: Bool = false) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func prefersInitialOrdering() -> Bool {
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
