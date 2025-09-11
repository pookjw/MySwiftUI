#warning("TODO")

@_spi(Internal)
open class EventBindingBridge {
    public weak var eventBindingManager: EventBindingManager? = nil
//    private var trackedEvents: [EventID: EventBindingBridge.TrackedEventState] = [:]
    
    @MainActor
    @_alwaysEmitIntoClient
    public init() {}
    
    @MainActor
    @_alwaysEmitIntoClient
    public init(eventBindingManager: EventBindingManager) {
        self.eventBindingManager = eventBindingManager
    }
}
