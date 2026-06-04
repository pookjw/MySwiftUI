public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
open class __RKEntityAction : @MainActor CustomStringConvertible, NSCopying {
    public enum State : Equatable {
        case notStarted
        case running
        case progress(Double)
        case finished
        case stopped
        case failed
        
        public static func == (a: __RKEntityAction.State, b: __RKEntityAction.State) -> Bool {
            assertUnimplemented()
        }
    }
    
    @preconcurrency @MainActor public init(targetEntity: Entity? = nil) {
        assertUnimplemented()
    }
    
    public typealias CompletionHandler = (_ success: Bool) -> Void
    
    public var targetEntity: Entity?
    
    public var completionHandler: __RKEntityAction.CompletionHandler?
    
    public var isAlternate: Bool
    
    public var isExclusive: Bool
    
    public var exclusiveBlocksForCompletion: Bool
    
    public var state: __RKEntityAction.State {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var multiplePerformBehaviour: __RKEntityActionMultiplePerformBehavior
    
    public func performAction(with context: __RKEntityActionContext) {
        assertUnimplemented()
    }
    
    public func shouldContinueOnPerform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    public func preloadAssets() {
        assertUnimplemented()
    }
    
    @discardableResult
    @preconcurrency @MainActor open func perform(with context: __RKEntityActionContext) -> Bool {
        assertUnimplemented()
    }
    
    public func addStateObserver(_ observer: any __RKEntityActionStateObserver) {
        assertUnimplemented()
    }
    
    public func removeStateObserver(_ observer: any __RKEntityActionStateObserver) {
        assertUnimplemented()
    }
    
    public func reversed() -> __RKEntityAction? {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public var description: String {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    @preconcurrency @MainActor public func stop() -> Bool {
        assertUnimplemented()
    }
    
    public func isExclusiveWith(action: __RKEntityAction) -> Bool {
        assertUnimplemented()
    }
    
    @objc public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    
    public func clone(matching entity: Entity, newEntity: Entity) -> (action: __RKEntityAction?, anythingChanged: Bool) {
        assertUnimplemented()
    }
    
    public func prefersInitialOrdering() -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityAction {
    public struct ActionStateObservation {
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __RKEntityAction {
    public static func action(for specification: __RKEntityActionSpecification, entityLookupTable: __RKEntityLookupTable) -> __RKEntityAction {
        assertUnimplemented()
    }
}
