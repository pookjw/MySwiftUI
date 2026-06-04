public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
open class __RKEntityTrigger : CustomStringConvertible {
    public init() {
        assertUnimplemented()
    }
    
    public var reversible: Bool
    
    public var shouldReverse: Bool
    
    public var shouldFireAlternate: Bool
    
    @preconcurrency @MainActor open func matches(with trigger: __RKEntityTrigger) -> Bool {
        assertUnimplemented()
    }
    
    public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    public func clone(matching entity: Entity, newEntity: Entity) -> __RKEntityTrigger? {
        assertUnimplemented()
    }
    }

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __RKEntityTrigger : NSCopying {
    @objc dynamic public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityTrigger {
    public static func trigger(for specification: __RKEntityTriggerSpecification, entityLookupTable: __RKEntityLookupTable) -> __RKEntityTrigger {
        assertUnimplemented()
    }
}
