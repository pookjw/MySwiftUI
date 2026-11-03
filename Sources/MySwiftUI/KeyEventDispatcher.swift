// DEEBAE35447F92C37FF6C5895EB67C42
@_spi(Internal) internal import MySwiftUICore

struct KeyEvent : Equatable, NonGestureEventType, ModifiersEventType {
    static func == (lhs: KeyEvent, rhs: KeyEvent) -> Bool {
        assertUnimplemented()
    }
    
    private(set) var phase: EventPhase
    private(set) var timestamp: Time
    var binding: EventBinding?
    var modifiers: EventModifiers
    private var keys: String
    private var stringValue: String
    private var keyID: AnyHashable
}

extension KeyEvent {
    struct Tracker {
        private var activeVersions: [AnyHashable : DisplayList.Version] = [:]
        
        func serial(for event: KeyEvent) -> Int {
            assertUnimplemented()
        }
    }
}

struct KeyEventDispatcher : ForwardedEventDispatcher {
    static var eventType: any EventType.Type {
        return KeyEvent.self
    }
    
    private var bindings: [EventID: [KeyPress.Handler]] = [:]
}
