public import Foundation

@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityAnimateAction : __RKEntityAction {
    override public func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    override public func stop() -> Bool {
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
    
    override public init(targetEntity: Entity? = nil) {
        assertUnimplemented()
    }
    }
