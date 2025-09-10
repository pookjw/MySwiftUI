#warning("TODO")
internal import Foundation

@_spi(Internal) public class EventBindingManager {
    package weak var host: EventGraphHost? = nil
    package weak var delegate: EventBindingManagerDelegate? = nil
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

package protocol EventGraphHost: AnyObject, EventBindingManagerDelegate {
    
}

package protocol EventBindingManagerDelegate: AnyObject {
    
}

package protocol ForwardedEventDispatcher {
    
}

package struct EventBinding {
    private var responder: ResponderNode
}
