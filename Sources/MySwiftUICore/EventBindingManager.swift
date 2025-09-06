#warning("TODO")
internal import Foundation

@_spi(Internal) public class EventBindingManager {
    private weak var host: EventGraphHost? = nil
    private weak var delegate: EventBindingManagerDelegate? = nil
    private var forwardedEventDispatchers: [ObjectIdentifier : ForwardedEventDispatcher] = [:]
    private var eventBindings: [EventID : EventBinding] = [:]
    private var isActive: Bool = false
    private var eventTimer: Timer? = nil
    
    package init() {
    }
    
    package func addForwardedEventDispatcher(_ dispatcher: ForwardedEventDispatcher) {
        forwardedEventDispatchers[ObjectIdentifier(type(of: dispatcher))] = dispatcher
    }
}

protocol EventGraphHost: AnyObject {
    
}

protocol EventBindingManagerDelegate: AnyObject {
    
}

package protocol ForwardedEventDispatcher {
    
}

package struct EventBinding {
    private var responder: ResponderNode
}
