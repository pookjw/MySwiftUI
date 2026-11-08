internal import Foundation

@_spi(Internal) public final class EventBindingManager {
    package weak var host: EventGraphHost? = nil
    package weak var delegate: EventBindingManagerDelegate? = nil
    private var forwardedEventDispatchers: [ObjectIdentifier : ForwardedEventDispatcher] = [:]
    private var eventBindings: [EventID: EventBinding] = [:]
    private var isActive: Bool = false
    private var eventTimer: Timer? = nil
    
    package init() {
    }

    deinit {
        assertUnimplemented()
    }
    
    package func addForwardedEventDispatcher(_ dispatcher: ForwardedEventDispatcher) {
        forwardedEventDispatchers[ObjectIdentifier(type(of: dispatcher).eventType)] = dispatcher
    }

    func willRemoveResponder(_ responder: ResponderNode) {
        assertUnimplemented()
    }
}

package protocol EventGraphHost : AnyObject, EventBindingManagerDelegate {
    var eventBindingManager: EventBindingManager { get }
    var responderNode: ResponderNode? { get }
    var focusedResponder: ResponderNode? { get }
    var nextGestureUpdateTime: Time { get }
    func sendEvents(_ events: [EventID : EventType], rootNode: ResponderNode, at time: Time) -> GesturePhase<Void>
    func resetEvents()
    func gestureCategory() -> GestureCategory?
    func isDescendant(of object: AnyObject) -> Bool
}

extension EventGraphHost {
    package func isDescendant(of object: AnyObject) -> Bool {
        assertUnimplemented()
    }
}

@_spi(Internal) public protocol EventBindingManagerDelegate : AnyObject {
    func didBind(to event: EventBinding, id eventID: EventID)
    func didUpdate(phase: GesturePhase<Void>, in manager: EventBindingManager)
    func didUpdate(gestureCategory: GestureCategory, in manager: EventBindingManager)
}

extension EventBindingManagerDelegate {
    @_spi(Internal) public func didUpdate(gestureCategory: GestureCategory, in manager: EventBindingManager) {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func didBind(to event: EventBinding, id eventID: EventID) {
        assertUnimplemented()
    }
}

package protocol ForwardedEventDispatcher {
    static var eventType: any EventType.Type { get }
    var isActive: Bool { get }
    func wantsEvent(_ event: EventType, manager: EventBindingManager) -> Bool
    func receiveEvents(_ events: [EventID : EventType], manager: EventBindingManager) -> Set<EventID>
    func reset()
}

extension ForwardedEventDispatcher {
    package var isActive: Bool {
        assertUnimplemented()
    }
    
    package func wantsEvent(_ event: EventType, manager: EventBindingManager) -> Bool {
        assertUnimplemented()
    }
    
    package func reset() {
        assertUnimplemented()
    }
}

@_spi(Internal) public struct EventBinding {
    private var responder: ResponderNode
}

extension EventBinding : Equatable {
    @_spi(Internal) public static func == (lhs: EventBinding, rhs: EventBinding) -> Bool {
        assertUnimplemented()
    }
}
