public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityCollisionTrigger : __RKEntityTrigger {
    public var targetEntity: Entity?
    
    public init(targetEntity: Entity?, collidingEntities: [Entity] = [], tags: [String]) {
        assertUnimplemented()
    }
    
    override public func matches(with trigger: __RKEntityTrigger) -> Bool {
        assertUnimplemented()
    }
    
    @objc override dynamic public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> __RKEntityTrigger? {
        assertUnimplemented()
    }
    }
