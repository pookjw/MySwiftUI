public import Foundation
public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityTransformAction : __RKEntityAction {
    public var relativeToEntity: Entity?
    
    convenience public init(targetEntity: Entity?, location: SIMD3<Float>?, orientation: simd_quatf?, scale: Float?, duration: Float, moveType: __RKEntityMoveSelection, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, respectPhysics: Bool = false, physicsAngularCoefficient: Float = 0.0, physicsLinearCoefficient: Float = 0.0) {
        assertUnimplemented()
    }
    
    @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
    public init(targetEntity: Entity?, location: SIMD3<Float>?, orientation: simd_quatf?, scale: Float?, duration: Float, moveType: __RKEntityMoveSelection, ease: __RKEntityMoveEase = .none, easeType: __RKEntityMoveEaseType = .easeIn, respectPhysics: Bool = false, physicsAngularCoefficient: Float = 0.0, physicsLinearCoefficient: Float = 0.0, relativeToEntity: Entity? = nil) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
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
    
    override public func prefersInitialOrdering() -> Bool {
        assertUnimplemented()
    }
    }
