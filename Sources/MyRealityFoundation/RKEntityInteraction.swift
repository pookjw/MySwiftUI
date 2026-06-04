@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityInteraction {
    public static func interaction(for specification: __RKEntityInteractionSpecification, entityLookupTable: __RKEntityLookupTable) -> __RKEntityInteraction {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityInteraction : CustomStringConvertible {
    public var trigger: __RKEntityTrigger {
        get {
            assertUnimplemented()
        }
    }
    
    public var action: __RKEntityAction {
        get {
            assertUnimplemented()
        }
    }
    
    public var enabled: Bool
    
    public var accessibilityDescription: String?
    
    public init(trigger: __RKEntityTrigger, action: __RKEntityAction) {
        assertUnimplemented()
    }
    
    @available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
    convenience public init(trigger: __RKEntityTrigger, action: __RKEntityAction, accessibilityDescription: String? = nil) {
        assertUnimplemented()
    }
    
    public func fire(context: __RKEntityActionContext) {
        assertUnimplemented()
    }
    
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    public func clone(matching targetEntity: Entity, newEntity: Entity) -> __RKEntityInteraction? {
        assertUnimplemented()
    }
    }
