@_spi(Internal) private import MySwiftUICore

struct KeyEvent {
    private(set) var phase: EventPhase
    private(set) var timestamp: Time
    var binding: EventBinding?
    private var modifiers: EventModifiers
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

extension KeyEvent : Equatable, EventType {
    static func == (lhs: KeyEvent, rhs: KeyEvent) -> Bool {
        assertUnimplemented()
    }
}
