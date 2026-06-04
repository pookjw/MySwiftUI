public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityTriggerGroup : __RKEntityTrigger {
    public var triggers: [__RKEntityTrigger] {
        get {
            assertUnimplemented()
        }
    }
    
    public init(triggers: [__RKEntityTrigger]) {
        assertUnimplemented()
    }
    
    override public func matches(with trigger: __RKEntityTrigger) -> Bool {
        assertUnimplemented()
    }
    
    override public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    @objc override dynamic public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    override public func clone(matching entity: Entity, newEntity: Entity) -> __RKEntityTrigger? {
        assertUnimplemented()
    }
    }
