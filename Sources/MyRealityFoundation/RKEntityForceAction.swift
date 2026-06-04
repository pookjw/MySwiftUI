public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityForceAction : __RKEntityAction {
    public var force: SIMD3<Float>?
    
    public var velocity: SIMD3<Float>?
    
    public init(targetEntity: Entity?, force: SIMD3<Float>? = nil, velocity: SIMD3<Float>? = nil) {
        assertUnimplemented()
    }
    
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    @objc override public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    }
